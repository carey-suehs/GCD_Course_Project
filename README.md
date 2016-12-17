# GCD_Course_Project

This project contain the following files:

     1. The required R script.
     2. The required code book.
     3. The present readme file.
     
__________________________The required R script._____________________________________________________________ 

The "run_analysis.R" file contains the required R script. When opening this file, one can easily see that it is divided into several sections:

     *ASSIGNMENT & INSTRUCTIONS
     *WORKING DIRECTORY AND LIBRARY CALLS
     *DOWNLOAD THE DATA SET TO A LOCAL DIRECTORY
     *ROOT LEVEL FILES IN THE DATA SET
     *FILES IN THE "TEST" DIRECTORY
     *FILES IN THE "TRAIN" DIRECTORY
     *USE DESCRIPTIVE ACTIVITY/VARIABLE NAMES
     *MERGE THE TEST AND TRAINING DATA SETS
     *EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION
     *CREATE A 2ND, DATA SET w/ MEANS PER VAR, ACTIVITY, & SUBJECT
     
__________ASSIGNMENT & INSTRUCTIONS
    
This section simply restates the course assignment and any related instructions for clarity of purpose.

__________WORKING DIRECTORY AND LIBRARY CALLS
    
This section is where the working directory is set.  Other users will need to change this section to fit the working directory for their local system.

All package installation and library calls are also placed here.  Package installations are indicated as comments (preceded by "#") because the packages are already installed on my local system.  Other users may remove the "#"s as required.

__________DOWNLOAD THE DATA SET TO A LOCAL DIRECTORY

This section provides code that downloads the required data set to a local directory.  Other users will need to change that local directory to fit their needs.

!!!!!!!!!!!!!!!!NB: This download can take a few minutes.

__________ROOT LEVEL FILES IN THE DATA SET

This section provides code for reading root-level tables into the R environment. Comments are provided for each element at the root level of the data set. Other users will need to change directory calls to fit their needs.

__________FILES IN THE "TEST" DIRECTORY

This section provides code for reading the "test" subset tables into the R environment. Comments are provided for each element in the "test" directory. Other users will need to change directory calls to fit their needs.

__________FILES IN THE "TRAIN" DIRECTORY

This section provides code for reading the "train" subset tables into the R environment. Comments are provided for each element in the "train" directory. Other users will need to change directory calls to fit their needs.

__________USE DESCRIPTIVE ACTIVITY/VARIABLE NAMES

Because I am frequently interrupted when coding, I prefer to change to descriptive labels or variables names right from the start of a project (the assignment instructions suggested that this could be done towards the end of the assignment). 

This section provides code that changes non-informative integers corresponding to an activity to a vector of "strings" that clearly indicates the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 

Similarly, the "V1, V2, V3..." variables are renamed with informative names provided in the features list that came with the dataset. As listed in the readme files that accompany the assignment dataset, these labels can be interpreted according to the following:

     t: a time domain signal
     f: a frequency domain signal (application of a Fast Fourrier Transform)
     Acc: a measure provided by the accelerometer; these occur in three dimensions: X, Y & Z.
     Gyro: a measure provided by the gyroscope; these occur in three dimensions: X, Y & Z.
     X: first dimension
     Y: second dimension
     Z: third dimension
     Body: a first sub-component of the Acc signal
     Gravity: a second sub-component of the Acc signal
     Jerk: a jerk signal derived in time from body linear acceleration (accelerometer) and angular velocity (gyroscope)
     Mag: the magnitude of three-dimensional signals using the Euclidian norm
     mean(): Mean value
     std(): Standard deviation
     
For example, the variable "tBodyAcc-mean()-X" corresponds to the mean value of the "body" sub-component in the time domain of the first dimension (X) of acceleration measures provided by the accelerometer.

__________MERGE THE TEST AND TRAINING DATA SETS

This section provides code for creating an "all data" table that combines the test and training data sets.

__________EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION

This section provides code for creating "wide" and "long" subsets of the "alldata" table. The resulting dataframes "subset_wide" and "subset_long" can be considere as TIDY because:

     1. Each row corresponds to 1 observation.
     2. Only one type of observation is contained therein.
     3. Columns correspond to variables.
     
__________CREATE A 2ND, DATA SET w/ MEANS PER VAR, ACTIVITY, & SUBJECT

This section provides code for casting the "subset_long" element into the required table of average variable values per activity and subject.
