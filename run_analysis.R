#run_analysis.R
#See README.md and CodeBook.md for more details.

#The scripts in this file do the following:
##Downloads the file, if it does not yet exist, and reads the data into R.
##Then, to create a "tidy" data set, it does the following:
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#First, load necessary packages
library(dplyr)
setwd("C:/Users/mkcor/Desktop/R stuff/Coursera/Course 3 Getting and Cleaning Data")

##########################  Download the data and read it into R  ################################
#Download the data, if it does not yet exist.
ZipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Zip <- "UCI HAR Dataset.zip"
if (!file.exists(Zip)) {
  download.file(ZipUrl, Zip, mode = "wb")
}
unzip(Zip)

#Read training and test data into R
training_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
training_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
training_y <- read.table("./UCI HAR Dataset/train/y_train.txt")

test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Read features and activity labels into R
features <- read.table(("./UCI HAR Dataset/features.txt"), as.is = TRUE)
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Assign column names to activity
colnames(activity) <- c('activityID','activityLabel')


############################### 1. Merge the training and the test sets to create one data set #######################
MergedData <- rbind(
  cbind(training_subjects, training_x, training_y),
  cbind(test_subjects, test_x, test_y)
)
colnames(MergedData) <- c("subject", features[, 2], "activity")


#################### 2. Extract the measurements on the mean and standard deviation for each measurement #############
# Determine columns to keep (keep column names containing "subject", "activity", "mean" or "std")
ToKeep <- grepl("subject|activity|mean|std", colnames(MergedData))
#Save columns to keep in a new Dataset (this reduced the Dataset to 81 variablesin total)
Dataset <- MergedData[, ToKeep]


####################### 3. Uses descriptive activity names to name the activities in the data set ####################
#Replace activity value #s with named factor levels (i.e.walking, walking upstairs, walking downstairs, sitting, standing, laying)
Dataset$activity <- factor(Dataset$activity, 
                           levels = activity[, 1], labels = activity[, 2])

####################### 4. Label the data set with descriptive variable names ########################################
#Get the column names in the dataset
DatasetColumnNames <- colnames(Dataset)

#Remove special characters in the column names
DatasetColumnNames <- gsub("[\\(\\)-]", "", DatasetColumnNames)

#Removed redundant descriptions
DatasetColumnNames <- gsub("BodyBody", "Body", DatasetColumnNames)

#Expand abbreviations in column names
DatasetColumnNames <- gsub("mean", "Mean", DatasetColumnNames)
DatasetColumnNames <- gsub("std", "StandardDeviation", DatasetColumnNames)
DatasetColumnNames <- gsub("^f", "frequencyDomain", DatasetColumnNames)
DatasetColumnNames <- gsub("^t", "timeDomain", DatasetColumnNames)
DatasetColumnNames <- gsub("Acc", "Accelerometer", DatasetColumnNames)
DatasetColumnNames <- gsub("Gyro", "Gyroscope", DatasetColumnNames)
DatasetColumnNames <- gsub("Mag", "Magnitude", DatasetColumnNames)
DatasetColumnNames <- gsub("Freq", "Frequency", DatasetColumnNames)


#Use the DatasetColumnNames as column names in Dataset
colnames(Dataset) <- DatasetColumnNames


##### 5. Create an independent tidy data set with the average of each variable for each activity and each subject #####
#Group by subject and activity and get the mean
DatasetMeans <- Dataset %>% 
  group_by(subject, activity) %>%
  summarize_all(funs(mean))

#Create tidy data file
write.table(DatasetMeans, "TidyData.txt", row.names = FALSE, 
            quote = FALSE)

