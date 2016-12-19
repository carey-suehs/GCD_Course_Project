___________DATA DICTIONARY for the "subset_long_labeled.csv" and "averages_persubject_peractivity.csv" datasets_______________

This data dictionary describes the variables contained in the two csv files associated with this github project:

      "subset_long_labeled.csv"
      "averages_persubject_peractivity.csv"
      
Both of these datasets have similar long structures, as demonstrated in the following column structure descriptions. Note that only the 4th column differs between the two datasets.

Here is the column structure for "subset_long_labeled.csv":  

position:   1           2              3           4             
label:      "subject"   "activity"    "variable"    "value" 

Here is the column structure for "averages_persubject_peractivity.csv":  

position:   1           2              3           4             
label:      "subject"   "activity"    "variable"    "average" 



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
     Jerk: a jerk signal derived in time from body linear acceleration (accelerometer) and angular velocity (gyroscope)
     Mag: the magnitude of three-dimensional signals using the Euclidian norm
     mean...: Mean value
     std...: Standard deviation
     
    For example, the variable "tBodyAcc-mean()-X" corresponds to the mean value of the "body" sub-component in the time domain of the first dimension (X) of acceleration measures provided by the accelerometer.
    


_________________value
value: (specific to position 4 on "subset_long_labeled.csv") The corresponding numerical value measured for the associated variable.



_________________average
average: (specific to position 4 on "averages_persubject_peractivity.csv") An avereage of the numerical values measured for the associated subject-activity combination.
