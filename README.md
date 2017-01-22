# Coursera Project - Getting and Cleaning Data 

This repo contains three files:
* README.md, a description of source data and the steps to obtain a tidy data set
* run_analysis.R , R-code to create the tidy dataset
* Codebook.md, description of the variables in the tidy data set 

## Source data
Human Activity Recognition Using Smartphones Dataset
Zip: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Summary of source data 
Unzipping downloaded data created the directory: UCI HAR Dataset, in which two directories train and test. 
In this analysis the following files have been used:
* README.txt, features_info.txt and features.txt: for understanding of the data
* activity_labels.txt: links the activities tot the numbers in y_test.txt and y_train.txt
* features.txt: gives the feature names (variable names) of data in X_test.txt and X_train.txt
* directory test: data on test group
  .. y_test.txt: observations on activities, values 1:6, can be viewed as a "missing column" to X_test.txt
  .. X_test.txt: processed signal data 
  .. subject_test.txt: subjects (from test group), can be viewed as a "missing column" to X_test.txt  
*directory train:similar to test directory: y_train.txt, X_train.txt and subject_train.txt

In the original study 30 subjects have undertaken 6 activities wearing a Samsung SII. The subjects have been randomized in two groups 30%(9) in the test group, 70% (21) in the train group. Motion was measured by the built in gyroscope and accelerometer. From the signals of these devices different characteristics have been estimated, also some analysis has been done, resulting in 561 features per observation. Part of the features are mean values and standard deviations. 
For detailed information about the original data files and the data collected see README.txt and features_info.txt which come with the HAR data or visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Script run_analysis.R 
The R-script run_analysis.R reads source data and produces the tidy dataset summaryData.txt, summaryData.txt is written to the working directory. This tidy dataset contains averages of a subset of variables from the source data. 

**Important:** In order to be able to run the script it is assumed the data are downloaded and unzipped. The working directory contains the directory UCI HAR Dataset, in which the source data.
The script uses the packages dplyr and stringr, make sure you have installed them
From within R: type source("run_analysis.R") to run the script. 

The script does the following:
* loads dplyr and stringr
* reads the files activity_labels.txt and features.txt into R: activityLabels, features
* uses function read_createData() to create two datasets: 
  .. testData (2947 obs, 563 variables) and trainData (7352 obs, 563 variables)
  .. The function reads the data from X_...,y_ ...and subject_... -files, combines them to one dataset and names the variables.
  .. First variable: subjectID, second variable: activity, other variables are named according to features.
* combines testData and trainData to one dataset: allData
* selects the variables containing mean() and std() from allData, allData now has 68 columns: 
  .. subjectID, activity, 33 mean-variables  and 33 std-variables.
* replaces levels of activity by descriptive names, using activitylabels
* gives the variables in allData more descriptive names:
  ..* by removing - and (),
  ..* by replacing t by time, f by freqency, Acc by Accelerator, Gyro by Gyroscope,Mag by Magnitude, mean by Mean, std by StDev and BodyBody by Body,
* groups the allData by activity and subject
* creates tidy data frame summaryData by applying the mean() function to each combination of groups in allData
* writes summaryData to the file summaryData.txt in the working directory

**Note: ** In the original datasets X_test and X_train the column names are not unique levels(features) returns 477 levels, there are 561 columns. It turned out that just after selecting the mean and std measurements allData's  variable names are unique so no problem in this analysis




