# libraries needed
library(dplyr)

#name of the new folder
folder <- "./get_and_cleaning_data_week_4"

#check and create folder

if(!file.exists(folder)){
  dir.create(folder)}

#download data

data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(data.url,destfile="./get_and_cleaning_data_week_4/data.zip",method="auto")

unzip(zipfile="./get_and_cleaning_data_week_4/data.zip",exdir="./get_and_cleaning_data_week_4")

#Set new working directory, make sit easier to work
setwd("C:/Users/IÑIGO/Documents/coursera/get_and_cleaning_data_week_4/UCI HAR Dataset")

#########################
##1. Merges the training and the test sets to create one data set.
############################


#I start reading tables:

#train files:
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
 
#test files
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")






#########################
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################


#########################
##3. Uses descriptive activity names to name the activities in the data set
############################






#########################
##4. Appropriately labels the data set with descriptive variable names.
############################



#########################
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
############################


