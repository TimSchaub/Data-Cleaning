# Detailed description of run_analyis.R and procedure to clean and process data

1. Load data.table package for advanced table manipulation and load functions
2. Use fread to load test data for performance reasons from test/X_test.txt without header
3. Load labels and subjects from test/Y_test.txt and subject_test.txt without header
4. Repeat step 2 and 3 for folder train/ and files X_train.txt, Y_train.txt and subject_train.txt
5. Read features.txt using blank as separator to get the descriptive column names
6. Read activities.txt  using blank as separator to get the descriptive texts for the activity labels
7. Exchange column names for test and train data with second column of the features.txt data set
8. Create table with label keys and their description using the "merge" function for test data
9. Add activities and subjects to the test from the left using cbind
10. Rename column 1 to "activity" and column 2 to "subject"
10. Perform step 8,9,10 on train data
11. combine test and train data using rbind
12. Get vector with columns to be selected (all mean and std)
13. Use vector to extract respective columns into new table
14. Add "activity" and "subject" column to new table
15. Use lapply & by to extract result set.