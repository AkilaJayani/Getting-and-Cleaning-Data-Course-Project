# Getting and Cleaning Data Course Project
## Project instructions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Study design

Details regarding the experiment design and the initial processing of the data are given at the following website, 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Further information can be found in the README.txt and features_info.txt files which is also available in the above mentioned website. These details are reproduced here for completeness.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
## Raw Data Feature Information

Following signals are considered in the study mentioned above
*	tBodyAcc-XYZ
*	tGravityAcc-XYZ
*	tBodyAccJerk-XYZ
*	tBodyGyro-XYZ
*	tBodyGyroJerk-XYZ
*	tBodyAccMag
*	tGravityAccMag
*	tBodyAccJerkMag
*	tBodyGyroMag
*	tBodyGyroJerkMag
*	fBodyAcc-XYZ
*	fBodyAccJerk-XYZ
*	fBodyGyro-XYZ
*	fBodyAccMag
*	fBodyAccJerkMag
*	fBodyGyroMag
*	fBodyGyroJerkMag

Abbreviations of signal names
*	First letter t or f is stands for time or frequency domain measurements.
*	Body - movement of the subjects body
*	Gravity - gravitational acceleration
*	Acc - accelerometer measurement
*	Gyro - gyroscopic measurements
*	Jerk - sudden movement
*	Mag - magnitude
*	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

The set of variables that were estimated from these signals are,

*	mean() - Mean value
*	std() - Standard deviation
*	mad() - Median absolute deviation 
*	max() - Largest value in array
*	min() - Smallest value in array
*	sma() - Signal magnitude area
*	energy() - Energy measure. Sum of the squares divided by the number of values. 
*	iqr() - Interquartile range 
*	entropy() - Signal entropy
*	arCoeff() - Autorregresion coefficients with Burg order equal to 4
*	correlation() - correlation coefficient between two signals
*	maxInds() - index of the frequency component with largest magnitude
*	meanFreq() - Weighted average of the frequency components to obtain a mean frequency
*	skewness() - skewness of the frequency domain signal 
*	kurtosis() - kurtosis of the frequency domain signal 
*	bandsEnergy() - Energy of a frequency interval within the 64 bins of the FFT of each window.
*	angle() - Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable

*	gravityMean
*	tBodyAccMean
*	tBodyAccJerkMean
*	tBodyGyroMean
*	tBodyGyroJerkMean

**Note** - Features are normalized and bounded within [-1,1]. Therefore the data does not conform to the units of the original signals. 
 
## Procedure

Following steps were taken when converting the raw data to tidy data
*	Raw data had subject identifiers, labels and features in separate files. These were combined in a single data frame.
*	Training and testing data sets were then combined together
*	Extracted only the measurements on the mean and standard deviation for each signal (variable names that ended with either “mean()” or “sd()”)
*	Gave descriptive activity names to name the activities in the data set using the activity labels given in activity_labels.txt
*	To appropriately label the data set with descriptive variable names following changes were made to the variable names
  *	All the characters were made lower case letters
  *	Dash symbols “-” were replaced with underscores “_”
  *	Bracket symbols “()” were removed
  *	Typing mistakes such as repetition of the word body in some variable names were corrected
*	The dataset was reshaped to give the average of each variable for each activity and each subject

## Tidy Data Feature Information (Code book)

The tidy data set gives the average of each variable for each activity and each subject

The set of variables that appear in the tidy data set are,
*	 id             
*	 activity               
*	 tbodyacc_mean_xyz       
*	 tbodyacc_std_xyz        
*	 tgravityacc_mean_xyz    
*	 tgravityacc_std_xyz     
*	 tbodyaccjerk_mean_xyz   
*	 tbodyaccjerk_std_xyz    
*	 tbodygyro_mean_xyz      
*	 tbodygyro_std_xyz       
*	tbodygyrojerk_mean_xyz  
*	 tbodygyrojerk_std_xyz   
*	 tbodyaccmag_mean      
*	 tbodyaccmag_std        
*	 tgravityaccmag_mean    
*	 tgravityaccmag_std    
*	 tbodyaccjerkmag_mean   
*	 tbodyaccjerkmag_std    
*	 tbodygyromag_mean     
*	 tbodygyromag_std       
*	 tbodygyrojerkmag_mean  
*	 tbodygyrojerkmag_std  
*	 fbodyacc_mean_xyz       
*	 fbodyacc_std_xyz       
*	 fbodyaccjerk_mean_xyz   
*	 fbodyaccjerk_std_xyz    
*	 fbodygyro_mean_xyz      
*	 fbodygyro_std_xyz       
*	 fbodyaccmag_mean       
*	 fbodyaccmag_std        
*	 fbodyaccjerkmag_mean  
*	 fbodyaccjerkmag_std    
*	 fbodygyromag_mean      
*	 fbodygyromag_std      
*	 fbodygyrojerkmag_mean  
*	 fbodygyrojerkmag_std 

Abbreviations of variable names

*	id – subject identification number
*	First letter t or f is stands for time or frequency domain measurements.
*	body - movement of the subjects body
*	gravity - gravitational acceleration
*	acc - accelerometer measurement
*	gyro - gyroscopic measurements
*	jerk - sudden movement
*	mag - magnitude
*	'-xyz' is used to denote 3-axial signals in the X, Y and Z directions
*	mean - mean of the signal
*	sd – standard deviation of the signal

“id” is and integer variable, “activity” is a factor type variable and all the other variables are numeric features.

