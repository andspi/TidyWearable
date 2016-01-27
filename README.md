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
2. All needed data are imported. One table per file. Meaningful column names are added according to the descriptions in the original codebook ("README.txt"), but not across files (i.e. "X_test.txt" and "X_train.txt" are imported without names as these are stored in the "features.txt" file)
3. 

