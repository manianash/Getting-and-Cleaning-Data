# Clean up workspace
rm(list=ls())

# Download and unzip the data set from the given source and extract it locally
DataDownload <- function(url.data) {
  if (!file.exists("data")) {
    #  Check for existing data directory or create it
    dir.create(file.path("data"))
  }
  if (!file.exists("data/UCI HAR Dataset")) {
    # if data set isn't existing download it
    zipfile <- "data/UCI_HAR_data.zip"
    download.file(url.data, destfile=zipfile, method="auto")
    unzip(zipfile, exdir="data")
    message(sprintf("Data have been successfully downloaded and unzipped in folder %s/data/UCI HAR Dataset", getwd()))
    
  }
}

setWorkingDirectory <- function(directory) setwd(directory)

# 0. load the train and test files 
LoadData <- function() {
  # 0.1 change the working directory to read the data
  path <<- sprintf(getwd(),"%s/data/UCI HAR Dataset/", sep = "")
  
  # Read the Activity files
  
  ActivityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
  ActivityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
  
  # Read the Subject files
  
  SubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
  SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
  
  # Read Fearures files
  
  FeaturesTest <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
  FeaturesTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)  
  
  message("Training and the test sets have been loaded")
  
  return(list(ActivityTestData = ActivityTest, ActivityTrainData = ActivityTrain,
              SubjectTestData = SubjectTest, SubjectTrainData = SubjectTrain,
              FeaturesTestData = FeaturesTest, FeaturesTrainData = FeaturesTrain))
  
}

# 0. load the train and test files 
MergeData <- function() {
  
  dataset <- LoadData()
  
  Subject <- rbind(dataset$SubjectTrainData, dataset$SubjectTestData)
  Activity <- rbind(dataset$ActivityTrainData, dataset$ActivityTestData)
  Features<- rbind(dataset$FeaturesTrainData, dataset$FeaturesTestData)
  
  names(Subject) <- c("subject")
  names(Activity) <- c("activity")
  FeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
  names(Features) <- FeaturesNames$V2
  
  Data <- cbind(Features, Subject, Activity)
  
  message("Training and test sets have been merged")
  
  return(list(Data = Data, FeaturesNames = FeaturesNames))
}

SubsetData <- function(){
  
  Data <- MergeData()
  subsetFeaturesNames <- Data$FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", Data$FeaturesNames$V2)]
  
  # Subset the data frame Data by seleted names of Features
  selectedNames <- c(as.character(subsetFeaturesNames), "subject", "activity" )
  SubsetData <- subset(Data$Data,select=selectedNames)
  message("Extracted measurements on the mean and standard deviation for each measurement have been gained and returned")
  return(SubsetData = SubsetData)
  
}

DescriptiveActivity <- function(){
  
  Data <- SubsetData()
  ActivityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
  Data$activity <- factor(Data$activity, labels = ActivityLabels[,2])
  message("Named activities in the data set have been retured")
  return(Data = Data)
  
}

DescriptiveVaribleNames <- function(){
  
  Data <- DescriptiveActivity()
  names(Data)<-gsub("^t", "time", names(Data))
  names(Data)<-gsub("^f", "frequency", names(Data))
  names(Data)<-gsub("Acc", "Accelerometer", names(Data))
  names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
  names(Data)<-gsub("Mag", "Magnitude", names(Data))
  names(Data)<-gsub("BodyBody", "Body", names(Data))
  message("Data set with appropriately labels have been returned")
  return(Data)
  
}

TidyData <- function(){
  
  Data <- DescriptiveVaribleNames()
  library(plyr);
  Data2<-aggregate(. ~subject + activity, Data, mean)
  Data2<-Data2[order(Data2$subject,Data2$activity),]
  write.table(Data2, file = "tidydata.txt",row.name=FALSE)
  
  message("Here is your tidy data set!!")
  return(Data2)
}



DataDownload("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

Data <- TidyData()
