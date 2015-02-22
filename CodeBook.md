---
title: "Codebook"
author: "Martha-Evgenia Nikolaou"
date: "Sunday, February 22, 2015"
output: html_document
---

Getting and Cleaning Data course from coursera Data Science Specialization. Course Project COdebook.

==============================================================

# Human Activity Recognition Using Smartphones Dataset.
## Original Data: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

The data linked to represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

For detailed description of the original dataset, refer to `README.txt` and `features_info.txt` in the original data set zip archive.

## Tidy Data
A tidy data set is returned using the run_analysis.R script which contains aggregated mean values of all mean and standard deviation values from original data set grouped by activity and subject, resulting in a total of 180 records.

## Attribute Information:
For each record in the tidy data it is provided: 
- Its activity label (one out of 6 different activities):
  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIR
  - WALKING_UPSTAIRS
- An identifier of the subject who carried out the experiment (30 different subjects, IDs ranging from {1,2,3,...,30})
- 79 features with the
  - Mean of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
  - Mean of Triaxial Angular velocity from the gyroscope. 
  - numerical value ranging in [-1,1]

## Output Variables

The following table shows a table with all variables in the output file. The first column in the table shows the column number of the variable and the second column shows the variable name.

| Colmun |                         Variable                        |
| ------ | :------------------------------------------------------ |
|  1	|	subject	|
|	2	|	activity	|
|	3	|	timeBodyAccelerometer-mean()-X	|
|	4	|	timeBodyAccelerometer-mean()-Y	|
|	5	|	timeBodyAccelerometer-mean()-Z	|
|	6	|	timeBodyAccelerometer-std()-X	|
|	7	|	timeBodyAccelerometer-std()-Y	|
|	8	|	timeBodyAccelerometer-std()-Z	|
|	9	|	timeGravityAccelerometer-mean()-X	|
|	10	|	timeGravityAccelerometer-mean()-Y	|
|	11	|	timeGravityAccelerometer-mean()-Z	|
|	12	|	timeGravityAccelerometer-std()-X	|
|	13	|	timeGravityAccelerometer-std()-Y	|
|	14	|	timeGravityAccelerometer-std()-Z	|
|	15	|	timeBodyAccelerometerJerk-mean()-X	|
|	16	|	timeBodyAccelerometerJerk-mean()-Y	|
|	17	|	timeBodyAccelerometerJerk-mean()-Z	|
|	18	|	timeBodyAccelerometerJerk-std()-X	|
|	19	|	timeBodyAccelerometerJerk-std()-Y	|
|	20	|	timeBodyAccelerometerJerk-std()-Z	|
|	21	|	timeBodyGyroscope-mean()-X	|
|	22	|	timeBodyGyroscope-mean()-Y	|
|	23	|	timeBodyGyroscope-mean()-Z	|
|	24	|	timeBodyGyroscope-std()-X	|
|	25	|	timeBodyGyroscope-std()-Y	|
|	26	|	timeBodyGyroscope-std()-Z	|
|	27	|	timeBodyGyroscopeJerk-mean()-X	|
|	28	|	timeBodyGyroscopeJerk-mean()-Y	|
|	29	|	timeBodyGyroscopeJerk-mean()-Z	|
|	30	|	timeBodyGyroscopeJerk-std()-X	|
|	31	|	timeBodyGyroscopeJerk-std()-Y	|
|	32	|	timeBodyGyroscopeJerk-std()-Z	|
|	33	|	timeBodyAccelerometerMagnitude-mean()	|
|	34	|	timeBodyAccelerometerMagnitude-std()	|
|	35	|	timeGravityAccelerometerMagnitude-mean()	|
|	36	|	timeGravityAccelerometerMagnitude-std()	|
|	37	|	timeBodyAccelerometerJerkMagnitude-mean()	|
|	38	|	timeBodyAccelerometerJerkMagnitude-std()	|
|	39	|	timeBodyGyroscopeMagnitude-mean()	|
|	40	|	timeBodyGyroscopeMagnitude-std()	|
|	41	|	timeBodyGyroscopeJerkMagnitude-mean()	|
|	42	|	timeBodyGyroscopeJerkMagnitude-std()	|
|	43	|	frequencyBodyAccelerometer-mean()-X	|
|	44	|	frequencyBodyAccelerometer-mean()-Y	|
|	45	|	frequencyBodyAccelerometer-mean()-Z	|
|	46	|	frequencyBodyAccelerometer-std()-X	|
|	47	|	frequencyBodyAccelerometer-std()-Y	|
|	48	|	frequencyBodyAccelerometer-std()-Z	|
|	49	|	frequencyBodyAccelerometerJerk-mean()-X	|
|	50	|	frequencyBodyAccelerometerJerk-mean()-Y	|
|	51	|	frequencyBodyAccelerometerJerk-mean()-Z	|
|	52	|	frequencyBodyAccelerometerJerk-std()-X	|
|	53	|	frequencyBodyAccelerometerJerk-std()-Y	|
|	54	|	frequencyBodyAccelerometerJerk-std()-Z	|
|	55	|	frequencyBodyGyroscope-mean()-X	|
|	56	|	frequencyBodyGyroscope-mean()-Y	|
|	57	|	frequencyBodyGyroscope-mean()-Z	|
|	58	|	frequencyBodyGyroscope-std()-X	|
|	59	|	frequencyBodyGyroscope-std()-Y	|
|	60	|	frequencyBodyGyroscope-std()-Z	|
|	61	|	frequencyBodyAccelerometerMagnitude-mean()	|
|	62	|	frequencyBodyAccelerometerMagnitude-std()	|
|	63	|	frequencyBodyAccelerometerJerkMagnitude-mean()	|
|	64	|	frequencyBodyAccelerometerJerkMagnitude-std()	|
|	65	|	frequencyBodyGyroscopeMagnitude-mean()	|
|	66	|	frequencyBodyGyroscopeMagnitude-std()	|
|	67	|	frequencyBodyGyroscopeJerkMagnitude-mean()	|
|	68	|	frequencyBodyGyroscopeJerkMagnitude-std()	|
