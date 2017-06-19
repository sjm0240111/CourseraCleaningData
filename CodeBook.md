## Description
This is a code book for getting and cleaning the data of wearable computing data collected from the the accelerometers 
from the Samsung Galaxy S smartphone.

### About the data
quoted from the original description:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The data provided contain both training data and test data, and both data contains the measurements, the label and subject.

#### we use the run_analysis.R script to do the following things:
1. Merge the training data, its label and its subject. Do the same process on the test data, and merge all, called `totaldata`.
2. Give names to all column in totaldata. The names are originally in the file features.txt.
3. Extracts only the measurements on the mean and standard deviation for each measurement in the `totaldata`, called `exdatawlabel`.
4. Add a new column for `exdatawlabel` to show the description of the label, which are the moving states of the subject. 
5. Export the `exdatawlabel` as cleandata.txt.
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, called `averagedata`.
7. Export the `averagedata` as averagedata.txt.

### More informations:
For more information, please go to the website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
