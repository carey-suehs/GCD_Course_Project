#20161216 Carey Suehs
#This is a R script written in requirement for "Peer-graded Assignment: Getting 
#and Cleaning Data Course Project"

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


#___________1. MERGE THE TEST AND TRAINING DATA SETS__________________________

#This section binds data together to create one large table. A new variable 
#subset" is added, which indicates the original "testing" and "training" sets.

data_cols <- rbind(X_test, X_train)
activity <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

alldata <- cbind(subject, activity, data_cols)
colnames(alldata)[1] <- "subject"
colnames(alldata)[2] <- "activity_num"

#_______2.EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION______

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

# We can subsequently make a long version of the subset like this:
subset_long <- melt (subset_wide,  id=c("subject", "activity_num"))


#________3. USE DESCRIPTIVE ACTIVITY NAMES____________________________________

#use activity_num and the activities table to create a vector of activity labels
#for the subset_long

colnames(activities) <- c("activity_num", "activity") #need similar names
activity_nums <- data.frame(subset_long$activity_num)
colnames(activity_nums)[1] <- "activity_num"
activity <- join(activity_nums, activities, by = "activity_num", type="left")

#________4. USE DESCRIPTIVE VARIABLE NAMES______________________________________

#create a correspondance table between "v1" "v2" etc and feature names

x <- colnames(X_test)
y <- features$V2
feature_table <- data.frame(x,y)
colnames(feature_table) <- c("variable_num", "variable")

#create a vector of variable labels for the subset_long

variable_nums <- data.frame(subset_long$variable)
colnames(variable_nums)[1] <- "variable_num"
variables <- join(variable_nums, feature_table, by = "variable_num", type="left")

#create new long subset with activity and variable labels

subset_long_labeled <- data.frame(subset_long$subject, 
                        activity$activity, variables$variable, 
                        subset_long$value)
colnames(subset_long_labeled) <- c("subject", "activity", "variable", 
                                   "value")

write.table(subset_long_labeled, "subset_long_labeled.txt", row.names = FALSE)
#The subset_long_labeled dataset is TIDY because it concerns one type of
#observation, each row corresponds to an observation, and each column 
#corresponds to a variable.

#___5. CREATE A 2ND, DATA SET w/ MEANS PER VAR, ACTIVITY, & SUBJECT_____________

#The cast function can be used on the long version of the subset to obtain 
#averages per subject and activity for each variable:
subset_cast <- dcast(subset_long_labeled,  subject + activity ~ variable , mean)

cast_long <- melt (subset_cast,  id=c("subject", "activity"))
colnames(cast_long)[4] <- "average"

write.table(cast_long, "averages_persubject_peractivity.txt", row.names = FALSE)
