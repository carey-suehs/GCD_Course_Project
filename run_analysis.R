#20161216 Carey Suehs
#This is a R script written in requirement for "Peer-graded Assignment: Getting 
#and Cleaning Data Course Project"

#_________ASSIGNMENT & INSTRUCTIONS_____________________________________________

#The purpose of this project is to demonstrate your ability to collect, work 
#with, and clean a data set. The goal is to prepare tidy data that can be used 
#for later analysis. You will be graded by your peers on a series of yes/no 
#questions related to the project. You will be required to submit: 1) a tidy 
#data set as described below, 2) a link to a Github repository with your script 
#for performing the analysis, and 3) a code book that describes the variables, 
#the data, and any transformations or work that you performed to clean up the 
#data called CodeBook.md. You should also include a README.md in the repo with 
#your scripts. This repo explains how all of the scripts work and how they are 
#connected.

#One of the most exciting areas in all of data science right now is wearable 
#computing - see for example this article . Companies like Fitbit, Nike, and 
#Jawbone Up are racing to develop the most advanced algorithms to attract new 
#users. The data linked to from the course website represent data collected from 
#the accelerometers from the Samsung Galaxy S smartphone. A full description is 
#available at the site where the data was obtained:

#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Here are the data for the project:

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#You should create one R script called run_analysis.R that does the following.

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each 
    #measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set 
    #with the average of each variable for each activity and each subject.

#_________WORKING DIRECTORY AND LIBRARY CALLS_________________________________

setwd("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment")

#install.packages("reshape2")    #use this line for first package use
library(reshape2)

#install.packages("plyr")       #use this line for first package use
library(plyr)

#________________DOWNLOAD THE DATA SET TO A LOCAL DIRECTORY_________________
    
#!!!!!!!!!!!!!!!!!!!Can take a few minutes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

temp <- tempfile()
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zip_url, temp)
unzip(temp, exdir = "C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment")
unlink(temp)

#___________ROOT LEVEL FILES IN THE DATA SET___________________________________

#the "README.txt" and "features_info.txt" files can be opened and read with a 
    #text editor (no table data here)

#A list of feature names can be found here (e.g. "tBodyAcc-mean()-X"):
features <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/features.txt")

#A list of activity names can be found here (e.g. "WALKING"):
activities <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/activity_labels.txt")

#two more directories: "test" and "train"

#_____________FILES IN THE "TEST" DIRECTORY___________________________________

#There are 2947 obs. of  561 variables in the X_test.txt file.
#Variables are labeled V1, V2, v3 etc. and correspond to features.
X_test <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/test/X_test.txt")
str(X_test)

#There are 2947 obs. of  1 variable in the y_test.txt file.
#Contains integers ranging from 1 to 6 corresponding to activities.
y_test <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/test/y_test.txt")
str(y_test)
range(y_test)

#There are 2947 obs. of  1 variable in the subject_test.txt file.
#Contains integers ranging from 2 to 24 corresponding to subject numbers.
subject_test <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/test/subject_test.txt")
str(subject_test)
range(subject_test)

#one more directory: "Inertial Signals":  I don't think these are needed.

#_____________FILES IN THE "TRAIN" DIRECTORY___________________________________

#There are 7352 obs. of  561 variables in the X_train.txt file.
#Variables are labeled V1, V2, v3 etc. and correspond to features.
X_train <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/train/X_train.txt")
str(X_train)

#There are 7352 obs. of  1 variable in the y_train.txt file.
#Contains integers ranging from 1 to 6 corresponding to activities.
y_train <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/train/y_train.txt")
str(y_train)
range(y_train)

#There are 7352 obs. of  1 variable in the subject_train.txt file.
#Contains integers ranging from 1 to 30 corresponding to subject numbers.
subject_train <- read.table("C:/Users/csuehs/Documents/Coursera/Getting_And_Cleaning_Data/assignment/UCI HAR Dataset/train/subject_train.txt")
str(subject_train)
range(subject_train)

#one more directory: "Inertial Signals":  I don't think these are needed.

#________3&4 USE DESCRIPTIVE ACTIVITY/VARIABLE NAMES____________________________________

#rename variables in y_test and y_train as "activity_num" or "activity"

colnames(y_test) <- "activity_num"
colnames(y_train) <- "activity_num"
colnames(activities) <- c("activity_num", "activity")

#rename variables in subject_test and subject_train as "subject"

colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

#_____________4. USE DESCRIPTIVE VARIABLE________________________________

#rename variables in X_test and X_train according to features

colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

#___________1. MERGE THE TEST AND TRAINING DATA SETS__________________________

#Merge tables with a left join to get activity lists.  NB: using the "merge"
#function to do this re-orders the observations, which screws up further clip-
#boarding onto other data.  The "join" function does not have this problem.

y_test_factor <- join(y_test, activities, by = "activity_num", type="left")
y_train_factor <- join (y_train, activities, by = "activity_num", type="left")

# First creat 2 tables ("test" and "train") with columns like this:
    # Subset - Subject - Activity - V1 - V2 - V3 etc

activity <- y_test_factor$activity  #create a vector by itself
subset <- rep("test", dim(y_test)[1])  #create a vector by itself 
test <- cbind(subset, subject_test, activity, X_test) #bind everything together
unlink(activity); unlink(subset)  #clear variables for next section

activity <- y_train_factor$activity  #create a vector by itself
subset <- rep("train", dim(y_train)[1])   #create a vector by itself
train <- cbind(subset, subject_train, activity, X_train)  #bind all together
unlink(activity); unlink(subset)  #clear variables

# Combine the 2 tables

alldata <- data.frame(rbind(test, train))


#_______2.EXTRACTION ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION___

# According to the features_info.txt file, the following variables exist:

    #tBodyAcc-XYZ               3 variables
    #tGravityAcc-XYZ            3 variables
    #tBodyAccJerk-XYZ           3 variables
    #tBodyGyro-XYZ              3 variables
    #tBodyGyroJerk-XYZ          3 variables
    #tBodyAccMag                1 variable
    #tGravityAccMag             1 variable
    #tBodyAccJerkMag            1 variable
    #tBodyGyroMag               1 variable
    #tBodyGyroJerkMag           1 variable
    #fBodyAcc-XYZ               3 variables         
    #fBodyAccJerk-XYZ           3 variables
    #fBodyGyro-XYZ              3 variables
    #fBodyAccMag                1 variable
    #fBodyAccJerkMag            1 variable
    #fBodyGyroMag               1 variable
    #fBodyGyroJerkMag           1 variable

# This makes for 3x8=24 + 9 = 33 variables. So we will be looking for
# 66 features:  33 mean variables and 33 standard deviation variables.

# Looking at the variable names in "features", these variables all have
# characteristic strings:  "mean()" or "std()".  We can grep these like this:

mean_std_index <- grep("mean\\(\\)|std\\(\\)", features$V2)

# We can then get the desired subset like this:
subset_wide <- cbind(alldata[, 1:3], alldata[, mean_std_index+3])
# This subset has 1 observation per row, variables in columns and
# concerns only one type of observation.  It is therefore TIDY.

# We can subsequently make a long version of the subset like this (this is also
#considered a tidy data set):
subset_long <- melt (subset_wide,  id=c("subset","subject", "activity"))

#These wide and long datasets can be exported to the local directory like this:
write.csv(subset_wide, "subset_wide.csv")
write.csv(subset_long, "subset_long.csv")

#___5. CREATE A 2ND, DATA SET w/ MEANS PER VAR, ACTIVITY, & SUBJECT_____________

#The cast function can be used on the long version of the subset to obtain 
#averages per subject and activity for each variable:
subset_cast <- dcast(subset_long,  subject + activity ~ variable , mean )

write.csv(subset_cast, "subset_cast.csv")
