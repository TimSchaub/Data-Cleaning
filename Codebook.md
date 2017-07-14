# Code book for wearables test and training data
## Study design

Calculate the means of all mean() and std() variables of the raw data as made available under https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Variables



All variables without units.

Measured variables (all without units and bound to [-1;1]

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

where XYZ is indicating the respective axis.

The set of variables derived from these signals/measurements and that are used in this case: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The following variables are used for further processing:

* testdata 					data.frame holding test data
* testlabels 					vector holding label keys for data
* testsubjects				vector holding subjects for data
  
* traindata 					data.frame holding train data
* trainlabels 				vector holding label keys
* trainsubjects				vector holding subjects for data
  
* features					data.frame with human readable labels for (test/train) data
* activities					data.frame with human readable labels for (test/train) labels
  
* cleartestlabels				testlabels combined with respective descriptions
* cleartrainlabels			trainlabels combined with respective descriptions
  
* mergedData					data.frame for combined recordsets
  
* colIndexes					vector of columns to be extracted from source data sets (only mean() and std())
* extractedData				data.frame containing the extracted columns
  
* resultData					data.table build with "extractedData" with "activity" and "subject" column as first two columns



## Tidying

Change column headings to more descriptive texts for test and training data by using the "features" data
Map test and training labels with descriptions for activities from "activities" data

## Combining
* Adding activity column with human readable names to test data and train data
* Union test and training data with rbind
* Select all columns from test and training data the contain "mean()" or "std()" or "Mean" into a new data.table

## Result evaluation

1. Calculate mean by activity & subject on "resultData" data.table using lapply & by
