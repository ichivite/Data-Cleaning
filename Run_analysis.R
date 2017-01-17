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

#Set new working directory, makes it easier to work
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

#Bind tables:
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)



#Set column names
feature_columns <- read.table('features.txt')
activity_labels <- read.table('activity_labels.txt')


colnames(x_merged)<-feature_columns$V2
colnames(y_merged)<-"Activity"
colnames(subject_merged)<-"Subject"

#small check
x.row <- nrow(x_merged)
y.row <- nrow(y_merged)

if(x.row != y.row){
  print("No equal number of rows")}



##Final data merge

temp.variable <- cbind( x_merged, y_merged)
dataset <- cbind(temp.variable, subject_merged)


#########################
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################

mean_stdv.dataset <- dataset[grep("mean\\(\\)|std\\(\\)", colnames(dataset))]



#########################
##3. Uses descriptive activity names to name the activities in the data set
############################
activity_labels <- read.table('activity_labels.txt')### also done in step 1, so dataset had colums names
y_merged[, 1] <- activity_labels[y_merged[, 1], 2]
colnames(y_merged) <- "activity" ### also done in step 1, so dataset had colums names


#########################
##4. Appropriately labels the data set with descriptive variable names.
############################

colnames(dataset) <- "subject"

data.total <- cbind(x_merged, y_merged, subject_merged)

#########################
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
############################

step5 <- aggregate(. ~subject + Activity, data.total, mean)
step5 <- mean_data[order(mean_data$subject_id,mean_data$Activity_names),]
write.table(step5, file = "mean_data.txt",row.name=FALSE)



