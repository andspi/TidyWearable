# TidyWearable
Course project for DSC - Getting and Cleaning Data

## Purpose
Create two concise and descriptive data tables from the original data

## Files
This Project includes the following files:
+ README.md
+ run_analysis.R  - the script to transform the "UCI HAR Dataset" according to the task given
+ Codebook.md - a description of the data
+ tidyWearable.csv - the output and resulting data set
+ tidyWearableMeans.csv - the same but with the average of each variable for each activity and each subject

## Transformation
The steps taken in the "run_analysis.R" script are:
1. It checks for the unzipped raw data and downloads the data if necessary.
2. All needed data are imported. One table per file. Meaningful column names are added according to the descriptions in the original codebook ("README.txt"), but not across files (i.e. "X_test.txt" and "X_train.txt" are imported without names as these are stored in the "features.txt" file).
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

3. The features list is now used to name the "X_..." table variables.
4. The 6 data tables are then appended with explicit ids for each observation (instead of using the row number), so to allow merging within the two sets.
5. The two sets of three are merged by this id.
6. The column names of both tables are matched and a factor variable to identify the entries as belonging to either set ("train" or "test") is added.
7. The sets are combined.
8. The numeric activity lables are substituted by a descriptive factor through the category table. << end of merging >>
9. The select function of the dplyr package is used to isolate

