# January 22, 2017
# 
# This script reads HAR data, combines them to a dataframe (allData), 
# which only contains means and standard deviations of original observations.
# Summarizes allData: mean of variables per subjectID and activity in 
# a new data frame: summmaryData
# Writes summaryData is to summaryData.txt in the working directory
#
# Important: 
# * unzipped data is available in the directory ./UCI HAR Dataset
# * uses packages stringr and dplyr
#
# Source data:
# Info: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Zipfile contains directory "UCI HAR Dataset", which contains two directories "train" and "test" 
# observation data files in ./UCI HAR Dataset/test and .Data/UCI HAR Dataset/train
# explanatory data files in ./UCI HAR Dataset
#
# I have downloaded the files by:
# url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url, destfile="GetCleanProject.zip", method="libcurl") 
# unzip ("GetCleanProject.zip")
# file.remove("GetCleanProject.zip")
#
################################################################################

# function declaration

read_createData <- function(testortrain,dataDirectory,features){
#
# Reads Original HAR data into R and creates dataframe with test/train data
# INPUT: 
# * testortrain: character string referring to the sort of data: "test" or "train"
#   test data are stored in subdirectory test, train data in subdirectory train
# * dataDirectory, the directory which contains all data, 
# * features, vector with variable names
# OUTPUT: 
# dataframe of test or train data, with named columns 
# columns: "subjectID", "activity", other columns named according to features
#        
        directory<- paste(dataDirectory,testortrain,"/", sep="")
        XFile<-paste(directory,"X_", testortrain,".txt", sep="")
        yFile<-paste(directory,"y_", testortrain,".txt", sep="")
        subjectFile<-paste(directory,"subject_", testortrain,".txt", sep="")
        subject<-read.table(subjectFile)
        names(subject)<-"subjectID"
        y<-read.table(yFile)
        names(y)<-"activity"
        X<-read.table(XFile)
        names(X)<-features 
        X<-cbind(subject,y,X)
        X
}
# End of function declaration
###############################################################################

library(stringr)
library(dplyr)

# Read data into R

dataDirectory<-"./UCI HAR Dataset/"
activityLabels<-read.table(paste(dataDirectory,"activity_labels.txt", sep=""))
features<-read.table(paste(dataDirectory,"features.txt", sep=""))
features<-features[,2]  # second column stores the variable names
testData<-read_createData("test",dataDirectory, features)
trainData<-read_createData("train",dataDirectory, features)

### Merge testData and trainData

allData<-bind_rows(testData,trainData)
rm(testData)
rm(trainData)

# Select mean() and std() variables

allData<- select(allData,subjectID,activity,matches(".mean\\(.|.std\\(."))

# Adjust activity descriptions a bit and replace activity levels by descriptions

activityLabels[,2]<-tolower(activityLabels[,2])
activityLabels[,2]<-str_replace(activityLabels[,2],"\\_"," ")
allData$activity<-activityLabels[allData$activity,2]

# Replace variable names by more descriptive ones

names(allData)<-str_replace(names(allData),"BodyBody","Body") %>%
        str_replace("(\\(\\))","") %>%
        str_replace_all("(\\-)","") %>% 
        str_replace("^t","time") %>%
        str_replace("^f","frequency") %>%
        str_replace("Acc","Accelerator") %>%
        str_replace("Gyro","Gyroscope") %>%
        str_replace("mean","Mean") %>%
        str_replace("std","StdDev") %>%
        str_replace("Mag","Magnitude")
        
# Create dataframe summaryData with means per subjectID and activity; write to file

summaryData<-group_by(allData,subjectID,activity) %>%
             summarize_all(mean)
write.table(summaryData,"summaryData.txt", row.name=FALSE)      

