# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject -> this data is calles 'mean_data.txt'



# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_merged`, `y_merged` and `subject_merged` merge the previous datasets to further analysis.
* 
* 'dataset' contains the Merged training and  test sets in one data set

* `feature_columns` contains the correct names for the `x_merged` dataset.
* A similar approach is taken with activity names through the `activities` variable.
* `dataset` merges `x_merged`, `y_merged` and `subject_data` in a big dataset.
* Finally, `mean_data` is the '.txt' file that we are asked to upload with all the data .
