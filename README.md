# AssignmentGettingCleaningData
Coursera assignment "getting cleaning data"

AssignmentGettingCleaningData

Coursera assignment "getting cleaning data" https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

# Background

The experiment is carried out by UCI, named "Human Activity Recognition Using Smartphones", project homepage :https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

the description of orignal experiments as below

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# Objective

demonstrate your ability to collect, work with, and clean a data set, check above URL for detail. the assignement has 5 topics as below

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# how to use

unzip getdata%2Fprojectfiles%2FUCI HAR Dataset.zip change directory to "Dataset"

run run_analysis.R

## script

run_analysis.R read the orignal files and clean up and write to output files

## output file

* mean_std.txt
this is file after finish first 4 topics, not required by assignment, but for verification by peers review.

* object_by_activities.txt
this is the file of 5th topic

## cookbook
cookbook.txt is explainantion of object_by_activities.csv, see oringal cookbook in zip file for detail
