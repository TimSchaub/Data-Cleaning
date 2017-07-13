run_analysis <- function () {
  
  
  #library(data.table, lib="C:\\Local\\Training\\Data Science\\lib")

  #read files
  
  
  testdata <- fread(".\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE)               #test dataset
  testlabels <- read.csv(".\\UCI HAR Dataset\\test\\Y_test.txt", header=FALSE)          #test labels
  testsubjects <- read.csv(".\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE) #test subjects
  
  
  traindata <- fread(".\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE)            #training dataset
  trainlabels <- read.csv(".\\UCI HAR Dataset\\train\\Y_train.txt", header=FALSE)       #training labels
  trainsubjects <- read.csv(".\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE) #test subjects
  
  #get master data
  features <- read.csv(".\\UCI HAR Dataset\\features.txt", header=FALSE, sep=" ", stringsAsFactors = FALSE)         #column heads
  activities <-read.csv(".\\UCI HAR Dataset\\activity_labels.txt", header=FALSE, sep=" ", stringsAsFactors = FALSE) #activity mappings
  
  colnames(testdata) <- features[,2]        #column Names for data from features master data
  colnames(traindata) <- features[,2]   #column Names for data from features master data
  

  cleartestlabels <- merge(testlabels, activities[,2])      # create mapping table for test data activities
  testdata <- cbind(cleartestlabels[,2],testsubjects, testdata)           # add activity & subject column
  names(testdata)[1] <- "activity"                          # give it a descriptive name
  names(testdata)[2] <- "subject"                          # give it a descriptive name
  str(testdata)

  cleartrainlabels <- merge(trainlabels, activities[,2])    # create mapping table for training data activities
  traindata <- cbind(cleartrainlabels[,2], trainsubjects, traindata)        # add activity & subject column
  names(traindata)[1] <- "activity"                         # give it a descriptive name
  names(traindata)[2] <- "subject"                         # give it a descriptive name
  str(traindata)
  
  #combine datasets with a union logic using rbind
  
  mergedData <- rbind(testdata, traindata)
  
  #do the extraction using data.frame coerce which makes selection more flexible
  
  colIndexes <- grep("mean()|std()", names(mergedData))                           #select required variable columns
  extractedData <- data.frame(mergedData[,colIndexes, with=FALSE])                            #extract them to "extractedData" data frame
  resultData <- data.table(cbind(activity=mergedData$activity, subject=mergedData$subject, extractedData))    #recombine extractedData with activity column
  
  
  activityMeans <- resultData[,lapply(.SD,mean), by=.(activity, subject)]   #means per activity
}