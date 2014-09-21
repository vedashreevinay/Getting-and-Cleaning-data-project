##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Assumces the data is in UCI HAR Dataset/ and working dir is set to this dir.


func1 <- function(){  
    require("data.table")
    require("reshape2")

    ##step1: read all the data. 
    
    features<- read.table("./features.txt")[,2]
    x_train <- read.table("./train/X_train.txt")
    y_train <- read.table("./train/Y_train.txt")
    x_test <- read.table("./test/X_test.txt")
    y_test <- read.table("./test/y_test.txt")
    activity_labels <- read.table("./activity_labels.txt")
    subject_train <- read.table("./train/subject_train.txt")
    subject_test <- read.table("./test/subject_test.txt")
    
    ###step2: name the columns of the x train data set. 
    names(x_train) = features
    names(x_test) = features
    
    ##step 3: read the mean and std values only 
    
    needed_features <- grepl("mean|std", features)
    x_train <- x_train[,needed_features]
    
    x_test <-x_test[,needed_features]
    
    ##step 4: merge the y_train and y-test with the activity labels. 
    y_train <- activity_labels[y_train[,1],]
    y_test <- activity_labels[y_test[,1],]
    
    names(y_test) = c("Activity_ID", "Activity")
    names(y_train) = c("Activity_ID", "Activity")
    names(subject_train) = c("Person")
    names(subject_test) = c("Person")
    
    ##step 5: cbind all the tables
    
    train_data <- cbind(as.data.table(subject_train), x_train, y_train)
    test_data <- cbind(as.data.table(subject_test), x_test, y_test)
      
    ##step6: merge train and test data
    data <- rbind(train_data, test_data)
    
    id_labels   = c("Person", "Activity_ID", "Activity")
    data_labels = setdiff(colnames(data), id_labels)
    melt_data      = melt(data, id = id_labels, measure.vars = data_labels)
    
    # Apply mean function to dataset using dcast function
    tidy_data   = dcast(melt_data, Person + Activity ~ variable, mean)
    
    if(!file.exists("./tidy_data.txt")){
      write.table(tidy_data, "./tidy_data.txt")
    }
    else{
      print("Tidy data file already exists!")
    }
    
}




                            

