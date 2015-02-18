Datasets source

This dataset is a product from the "Human Activity Recognition Using Smartphones" project which is available at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Run_analysis.R file

The script run_analysis.Rperforms the five steps (tasks) as described in the project's assignment.
•	First, all the training and test data is merged using the rbind() function.
•	Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After
extracting these columns, they are renamed according to the correct descriptive names given in features.txt.
•	As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and
they are substituted in the dataset.
•	On the whole dataset, those columns with vague column names are corrected.
•	Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects
* 6 activities = 180 rows).

The output file is called data_all_averaged.txt, and uploaded to this repository.

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each 
person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating
variables from the time and frequency domain. The data for the course assignment was accessible a zip file which
after download and unzip creates two folders with “training” and “testing” data. The README text document
describes how the data was collected and organized for the original study. The “features_info” text document
describes the signals acquisition and the variables of the feature vector. 

As requested by the authors of the study, we credit with citation:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for
Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational
Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


Feature Selection 

For additional details, please refer to the README and features.txt files in the original dataset to learn more
about the feature selection for this dataset. Here is a summary description:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ
and tGyro-XYZ. These time domain signals (’t’ to denote time) were captured at a constant rate of 50 Hz. The
signals were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency
of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements
on the mean and standard deviation for each measurement." To be complete, I included all variables having to do with
mean or standard deviation. In short, for this derived dataset, these signals were used to estimate variables of the
feature vector for each pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
•	tBodyAcc-XYZ
•	tGravityAcc-XYZ
•	tBodyAccJerk-XYZ
•	tBodyGyro-XYZ
•	tBodyGyroJerk-XYZ
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are: 
•	mean(): 	Mean value
•	std(): 		Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
•	gravityMean
•	tBodyAccMean
•	tBodyAccJerkMean
•	tBodyGyroMean
•	tBodyGyroJerkMean

Other estimates have been removed for the purpose of this excercise.
Note: features are normalized and bounded within [-1, 1].

The resulting variable names are of the following form: tbodyaccmeanx, which means the mean value of tBodyAcc-XYZ.


