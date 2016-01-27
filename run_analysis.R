# The analysis script for "TidyWearable" by AndSpi

# URLs
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
descrURL <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

# Extracting and importing the raw data

## checks for the unpacked dataset and downloads it if not available
if(!file.exists("UCI HAR Dataset")){
  download.file(fileURL, "dataset.zip")
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
y_train_id <- cbind("trainId" = seq(along.with = y_train[,1]), y_train)
sub_train_id <- cbind("trainId" = seq(along.with = y_train[,1]), subject_train)

## 


