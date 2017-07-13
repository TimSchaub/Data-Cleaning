##Code book for wearables test and training data
#Study design

Calculate the means of all mean() and std() variables of the raw data.

#Variables

All variables without units.


Raw data variables:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

where XYZ is indicating the respective axis.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


The following variables are used for further processing:

testdata 					data.frame holding test data
testlabels 					vector holding label keys for data
testsubjects				vector holding subjects for data

traindata 					data.frame holding train data
trainlabels 				vector holding label keys
trainsubjects				vector holding subjects for data

features					data.frame with human readable labels for (test/train) data
activities					data.frame with human readable labels for (test/train) labels

cleartestlabels				testlabels combined with respective descriptions
cleartrainlabels			trainlabels combined with respective descriptions

mergedData					data.frame for combined recordsets

colIndexes					vector of columns to be extracted from source data sets (only mean() and std())
extractedData				data.frame containing the extracted columns

resultData					data.table build with "extractedData" with "activity" and "subject" column as first two columns

activitySubjectMeans		data.table containing the means of all variables grouped by activity & subject 

#Tidying

Change column headings to more descriptive texts for test and training data by using the "features" data
Map test and training labels with descriptions for activities from "activities" data

#Combining
1. Adding activity column with human readable names to test data and train data
2. Union test and training data with rbind
3. Select all columns from test and training data the contain "mean()" or "std()" into a new data.table

#Result evaluation

1. Calculate mean by activity & subject on "resultData" data.table using lapply & by
