# The analysis script for "TidyWearable" by AndSpi

## Extracting and importing the raw data

### URLs
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
descrURL <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

### checks for the unpacked dataset and downloads it if not available
if(!file.exists("UCI HAR Dataset")){
  if(!file.exists("dataset.zip")){
    download.file(fileURL, "dataset.zip")
  }
  unzip("dataset.zip")
}

## read data into R
features <- read.table("./UCI HAR Dataset/features.txt", sep =" ", col.names = c("featureId","featureName"))
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep =" ", col.names = c("activityId","activityLabel"))

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("testLabel"))

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("trainingLabel"))

## add references and descriptions to data sets
### add column lables to data
names(x_test) <- features[,2]
names(x_train) <- features[,2]

### turn rows into explicit ids
y_test_id <- cbind("testId" = seq(along.with = y_test[,1]), y_test)
sub_test_id <- cbind("testId" = seq(along.with = subject_test[,1]), subject_test)
x_test_id <- cbind("testId" = seq(along.with = x_test[,1]), x_test)

y_train_id <- cbind("trainId" = seq(along.with = y_train[,1]), y_train)
sub_train_id <- cbind("trainId" = seq(along.with = y_train[,1]), subject_train)
x_train_id <- cbind("trainId" = seq(along.with = x_train[,1]), x_train)

## merging
### merging to two sets 
Mtest <- merge(sub_test_id,y_test_id, by = "testId")
Mtest <- merge(Mtest,x_test_id, by = "testId")

Mtrain <- merge(sub_train_id,y_train_id, by = "trainId")
Mtrain <- merge(Mtrain,x_train_id, by = "trainId")

### preperations for merging
Mtest_set <- cbind(set = "test", Mtest)
names(Mtest_set)[grep("testId", names(Mtest_set))] <- "id"
names(Mtest_set)[grep("testLabel", names(Mtest_set))] <- "activityLabel"

Mtrain_set <- cbind(set = "train", Mtrain)
names(Mtrain_set)[grep("trainId", names(Mtrain_set))] <- "id"
names(Mtrain_set)[grep("trainingLabel", names(Mtrain_set))] <- "activityLabel"

### merge
mergedDataSet <- rbind(Mtrain_set,Mtest_set)
mergedDataSet$activityLabel <- factor(mergedDataSet$activityLabel, levels = activity_labels[,1], labels = activity_labels[,2])
mergedDataSet$SubjectID <- factor(mergedDataSet$subjectID)

## extraction of means and standard deviations
require(dplyr)
mergedDataSet_sd_mean <- select(mergedDataSet, 1:4, contains("mean()"),contains("std()"))

## cleaning variable names
cleanNames <- gsub("[()]","", names(mergedDataSet_sd_mean))
cleanNames <- gsub("^f","frequencyDomain-", cleanNames, perl = T)
cleanNames <- gsub("^t","timeDomain-", cleanNames, perl = T)
cleanNames <- gsub("std","StandardDeviation", cleanNames, perl = T)
cleanNames <- gsub("mean","Mean", cleanNames, perl = T)
cleanNames <- gsub("Mag","Magnitude", cleanNames, perl = T)
cleanNames <- gsub("Gyro","Gyroscope", cleanNames, perl = T)
cleanNames <- gsub("Acc","Acceleration", cleanNames, perl = T)
mergedDataSet_sd_mean_cleaned <- mergedDataSet_sd_mean
names(mergedDataSet_sd_mean_cleaned) <- cleanNames

## export first tidy data file
write.csv(mergedDataSet_sd_mean_cleaned, file="tidyWearable.csv", row.names = F)

## derive reordered data set
require(reshape2)
meltedDataSet <- melt(mergedDataSet_sd_mean_cleaned[-(1:2)], id=1:2)
meltedDataSet_grouped <- group_by(meltedDataSet, subjectID, activityLabel, variable)
meltedDataSet_grouped_mean <- summarise(meltedDataSet_grouped, mean=mean(value))
meltedDataSet_grouped_mean_recast <- dcast(meltedDataSet_grouped_mean, subjectID + activityLabel ~ variable, value.var = "mean")

## edit names
names(meltedDataSet_grouped_mean_recast)[-(1:2)] <- gsub("^","mean-", names(meltedDataSet_grouped_mean_recast)[-(1:2)], perl = T)

## export second tidy data file
write.csv(meltedDataSet_grouped_mean_recast, file="tidyWearableMeans.csv", row.names = F)

