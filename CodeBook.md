DATA DICTIONARY for the "subset_long_labeled.txt" and "averages_persubject_peractivity.txt" datasets
____________________________________________________________________________________________________

This data dictionary describes the variables contained in the two txt files associated with this github project:

      "subset_long_labeled.txt"
      "averages_persubject_peractivity.txt"
      
Both of these datasets have similar long structures, as demonstrated in the following column structure descriptions. Note that only the 4th column differs between the two datasets.

Here is the column structure for "subset_long_labeled.txt":  

      position - label
      1 - "subject"
      2 - "activity"
      3 - "variable"
      4 - "value"

Here is the column structure for "averages_persubject_peractivity.txt":  

      position - label
      1 - "subject"
      2 - "activity"
      3 - "variable"
      4 - "average"



_________________subject

subject: An integer (factor variable) corresponding to 1 of 30 test subjects (human beings) who participated in the study. 



_________________activity

activity: A factor variable indicating which activity the subject was performing when measurements were being taken. These are: 

    WALKING, 
    WALKING_UPSTAIRS, 
    WALKING_DOWNSTAIRS, 
    SITTING, 
    STANDING, 
    LAYING
    


_________________variable

variable:  A factor variable corresponding to measurement codes. As listed in the readme files that accompany the assignment dataset, these labels can be interpreted according to the following:

     t: a time domain signal
     f: a frequency domain signal (application of a Fast Fourrier Transform)
     Acc: a measure provided by the accelerometer; these occur in three dimensions: X, Y & Z.
     Gyro: a measure provided by the gyroscope; these occur in three dimensions: X, Y & Z.
     X: first dimension
     Y: second dimension
     Z: third dimension
     Body: a first sub-component of the Acc signal
     Gravity: a second sub-component of the Acc signal
     Jerk: a jerk signal derived in time from body linear acceleration (accelerometer) 
           and angular velocity (gyroscope)
     Mag: the magnitude of three-dimensional signals using the Euclidian norm
     mean(): Mean value
     std(): Standard deviation
     
    For example, the variable "tBodyAcc-mean()-X" corresponds to the mean value of the "body" sub-component 
    in the time domain of the first dimension (X) of acceleration measures provided by the accelerometer.
    
    
The exact description of feature (variable) selection as provided in the dataset readme files is reproduced here for clarity:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."   


_________________value

value: (specific to position 4 on "subset_long_labeled.txt") The corresponding numerical value measured for the associated variable.



_________________average

average: (specific to position 4 on "averages_persubject_peractivity.txt") An avereage of the numerical values measured for the associated subject-activity combination.
