# Project-for-Getting-and-Cleaning-Data-Coursera-
Course project for Coursera's "Getting and Cleaning Data", Week 4

The goal of this project is to prepare tidy data that can be used for later analysis. Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
These data were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

a. This repository includes the following files:
  a. README (this file)
  b. CodeBook.md
  c. run_analysis.R
  d. TidyData.txt
 
b. The CodeBook.md file describes the contents of the data set. It indicates the variables and summaries calculated, along with units, and    all other relevant information.

c. The scripts in the file run_analysis.R do the following:
  1. Downloads the dataset, if it does not already exist in the working directory.
  2. Merges the training and the test sets to create one data set.
  3. Extracts only the measurements on the mean and standard deviation for each measurement.
  4. Uses descriptive activity names to name the activities in the data set.
  5. Appropriately labels the data set with descriptive variable names.
  6. From the data set in the previous step, creates an independent tidy data set with the average of each variable for each activity and        each subject.
  This script requires the dplyr package and was run in R version 3.2.2.
  
  d. The script results in the tidy data set file: TidyData.txt
