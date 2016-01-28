# Code book - Tidy Wearable

## Raw data
The raw data used for this project are measures and derived variables on human movements obtained with smartphone sensors.

The researchers (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory. DITEN - University degli Studi di Genova. activityrecognition@smartlab.ws) provide the data set online at:
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


They oriinal README.txt describes the data as:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features are described in the original "features_info.txt":
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Data used
As per instruction only the variables listing means and standard deviations were used.

a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

## Transformation
The steps taken in the "run_analysis.R" script are:

1. It checks for the unzipped raw data and downloads the data if necessary.
2. All needed data are imported into R. One table per file. Meaningful column names are added according to the descriptions in the original codebook ("README.txt"), but not across files (i.e. "X_test.txt" and "X_train.txt" are imported without names as these are stored in the "features.txt" file).
The needed data and respectively named tables are:
  + 6 tables containg data
    "subject_test"
    "x_test"
    "y_test"
    "subject_train"
    "x_train"
    "y_train"
  + 2 tables contain catagory labels: 
    "activity_labels"
    "features"
All other files (in the "Inertial Signals" folders) are ignored as they contain raw measurements and only the mean and standard diviation data are needed.
3. The features list is used to name the feature table variables.
4. The 6 data tables are appended with explicit ids for each observation (instead of using the row number), so to allow merging within the two sets.
5. The two sets of three are merged by this id.
6. The column names of both tables are matched and a factor variable to identify the entries as belonging to either set ("train" or "test") is added.
7. The sets are combined.
8. The numeric activity lables are substituted by a descriptive factor through the category table. 
9. The select function of the dplyr package is used to isolate the variables listing mean and standard deviation.
10. The variable names are cleaned by removing all non-alphanumeric characters except for minus. (The course lecture instruced not to use underscores, periods, and whitespaces in variable names.) The minus sign and "camelCase" capitalization were used to increase readablity of the long names. Abbreviations are substituted with the descriptive long version, according to the "README.txt" and "features_info.txt".
11. The resulting data set is exported to "tidyWearable.csv".
12. For the second data set the table is melted into a new set with subject and activity as id variables. The variables denoting the classification and id are droped as irrelevant for the summarizing averages.
13. The table is then grouped and summarized so to show the averages for all variables for all subjects and activities.
14. The table is then expanded to be tidy again, with one variable per column.
14. The resulting second data set is exported to "tidyWearableMeans.csv".



"subjectID", "activityLabel", "mean-timeDomain-BodyAcceleration-Mean-X", 
"mean-timeDomain-BodyAcceleration-Mean-Y", "mean-timeDomain-BodyAcceleration-Mean-Z", 
"mean-timeDomain-GravityAcceleration-Mean-X", "mean-timeDomain-GravityAcceleration-Mean-Y", 
"mean-timeDomain-GravityAcceleration-Mean-Z", "mean-timeDomain-BodyAccelerationJerk-Mean-X", 
"mean-timeDomain-BodyAccelerationJerk-Mean-Y", "mean-timeDomain-BodyAccelerationJerk-Mean-Z", 
"mean-timeDomain-BodyGyroscope-Mean-X", "mean-timeDomain-BodyGyroscope-Mean-Y", 
"mean-timeDomain-BodyGyroscope-Mean-Z", "mean-timeDomain-BodyGyroscopeJerk-Mean-X", 
"mean-timeDomain-BodyGyroscopeJerk-Mean-Y", "mean-timeDomain-BodyGyroscopeJerk-Mean-Z", 
"mean-timeDomain-BodyAccelerationMagnitude-Mean", "mean-timeDomain-GravityAccelerationMagnitude-Mean", 
"mean-timeDomain-BodyAccelerationJerkMagnitude-Mean", "mean-timeDomain-BodyGyroscopeMagnitude-Mean", 
"mean-timeDomain-BodyGyroscopeJerkMagnitude-Mean", "mean-frequencyDomain-BodyAcceleration-Mean-X", 
"mean-frequencyDomain-BodyAcceleration-Mean-Y", "mean-frequencyDomain-BodyAcceleration-Mean-Z", 
"mean-frequencyDomain-BodyAccelerationJerk-Mean-X", "mean-frequencyDomain-BodyAccelerationJerk-Mean-Y", 
"mean-frequencyDomain-BodyAccelerationJerk-Mean-Z", "mean-frequencyDomain-BodyGyroscope-Mean-X", 
"mean-frequencyDomain-BodyGyroscope-Mean-Y", "mean-frequencyDomain-BodyGyroscope-Mean-Z", 
"mean-frequencyDomain-BodyAccelerationMagnitude-Mean", "mean-frequencyDomain-BodyBodyAccelerationJerkMagnitude-Mean", 
"mean-frequencyDomain-BodyBodyGyroscopeMagnitude-Mean", "mean-frequencyDomain-BodyBodyGyroscopeJerkMagnitude-Mean", 
"mean-timeDomain-BodyAcceleration-StandardDeviation-X", "mean-timeDomain-BodyAcceleration-StandardDeviation-Y", 
"mean-timeDomain-BodyAcceleration-StandardDeviation-Z", "mean-timeDomain-GravityAcceleration-StandardDeviation-X", 
"mean-timeDomain-GravityAcceleration-StandardDeviation-Y", "mean-timeDomain-GravityAcceleration-StandardDeviation-Z", 
"mean-timeDomain-BodyAccelerationJerk-StandardDeviation-X", "mean-timeDomain-BodyAccelerationJerk-StandardDeviation-Y", 
"mean-timeDomain-BodyAccelerationJerk-StandardDeviation-Z", "mean-timeDomain-BodyGyroscope-StandardDeviation-X", 
"mean-timeDomain-BodyGyroscope-StandardDeviation-Y", "mean-timeDomain-BodyGyroscope-StandardDeviation-Z", 
"mean-timeDomain-BodyGyroscopeJerk-StandardDeviation-X", "mean-timeDomain-BodyGyroscopeJerk-StandardDeviation-Y", 
"mean-timeDomain-BodyGyroscopeJerk-StandardDeviation-Z", "mean-timeDomain-BodyAccelerationMagnitude-StandardDeviation", 
"mean-timeDomain-GravityAccelerationMagnitude-StandardDeviation", 
"mean-timeDomain-BodyAccelerationJerkMagnitude-StandardDeviation", 
"mean-timeDomain-BodyGyroscopeMagnitude-StandardDeviation", "mean-timeDomain-BodyGyroscopeJerkMagnitude-StandardDeviation", 
"mean-frequencyDomain-BodyAcceleration-StandardDeviation-X", 
"mean-frequencyDomain-BodyAcceleration-StandardDeviation-Y", 
"mean-frequencyDomain-BodyAcceleration-StandardDeviation-Z", 
"mean-frequencyDomain-BodyAccelerationJerk-StandardDeviation-X", 
"mean-frequencyDomain-BodyAccelerationJerk-StandardDeviation-Y", 
"mean-frequencyDomain-BodyAccelerationJerk-StandardDeviation-Z", 
"mean-frequencyDomain-BodyGyroscope-StandardDeviation-X", "mean-frequencyDomain-BodyGyroscope-StandardDeviation-Y", 
"mean-frequencyDomain-BodyGyroscope-StandardDeviation-Z", "mean-frequencyDomain-BodyAccelerationMagnitude-StandardDeviation", 
"mean-frequencyDomain-BodyBodyAccelerationJerkMagnitude-StandardDeviation", 
"mean-frequencyDomain-BodyBodyGyroscopeMagnitude-StandardDeviation", 
"mean-frequencyDomain-BodyBodyGyroscopeJerkMagnitude-StandardDeviation"
)
