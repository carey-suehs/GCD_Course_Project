# GCD_Course_Project

This project contain the following files:

     1. The required R script.
     2. The required code book.
     3. The present readme file.
     
__________________________The required R script. 

The "run_analysis.R" file contains the required R script. When opening this file, one can easily see that it is divided into several sections:

     *ASSIGNMENT & INSTRUCTIONS
     *WORKING DIRECTORY AND LIBRARY CALLS
     *DOWNLOAD THE DATA SET TO A LOCAL DIRECTORY
     *ROOT LEVEL FILES IN THE DATA SET
     *FILES IN THE "TEST" DIRECTORY
     *FILES IN THE "TRAIN" DIRECTORY
     *USE DESCRIPTIVE ACTIVITY/VARIABLE NAMES
     
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

This section provides code for reading the "ttrain" subset tables into the R environment. Comments are provided for each element in the "train" directory. Other users will need to change directory calls to fit their needs.

__________USE DESCRIPTIVE ACTIVITY/VARIABLE NAMES

Because I am frequently interrupted when coding, I prefer to change to descriptive labels or variables names right from the start of a project. This section provides code that changes non-informative integers corresponding to an activity to a vector of "strings" that clearly indicates the activity. Similarly, the "V1, V2, V3..." variables are renamed with informative names. As listed in the readme files that accompany the assignment dataset, these labels can be interpreted as follows:
