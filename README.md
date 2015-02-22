# Getting-and-Cleaning-Data
Getting and Cleaning Data course from coursera Data Science Specialization

---
title: "README"
author: "Martha-Evgenia Nikolaou"
date: "Sunday, February 22, 2015"
output: html_document
---
### R script run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Embedded functions:
#### Function: `DataDownload(url)`

Creates a folder named "data" in the working diractory if it does not exist. Downloads and extracts the zip file containing the dataset into the "data" folder.

### 1. Loading datasets
#### Function: `LoadData()`

Load the relevant data (Activity, Subset and Features files) from the newly created folder.
Returns a list with the datasets. 

### 2. Merging the train and test sets
#### Function: `MergeData()`

Retrieves data from the `LoadData()` function and merges the train and the test datasets.
Returns the merged dataset. 

### 3. Variable Selection 
#### Function: `SubsetData()`

Selects only the features that contain mean and standard deviationfrom the dataset.
Returns the subset dataset.

### 4. Use Descriptive activity names
#### Function: `DescriptiveActivity()`

Replace activity IDs with their matching labels from file `activity_labels.txt`.
Returns dataset with labeled activities.

### 5. Label the data set with descriptive variable names
#### Function:  `DescriptiveVaribleNames()`

Appropriately labels the data set with descriptive variable names.
Returns dataset with appropriate labels.


### 6. Creating the tidy data set
#### Function:  `TidyData()`

Returns a tidy data set with the average of each variable for each activity and each subject.

## Example of running the file:

```{r}
# DataDownload("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
# 
# Data <- TidyData()
```

