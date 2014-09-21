**Getting and Cleaning Data for Smartphones**
========================================================
Create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Steps:** 
1. Download the data and place in a local drive. The data directory is UCI HAR Dataset.
2. Place in run_snalysis.R script in the UCI HAR Dataset folder.
3. set working dir as UCI HAR Dataset. 
4. source (run_analysis.R)
5. output will be in tidy_data.txt file. 

**Dependencies**: Depends on data.table and reshap2 pacakages. The script installs this automatically. 
