## run_analysis

run_analysis <- function () {

    # get activity labels and set column name    
    dat_acti <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE)
    setnames(dat_acti, c("Activity", "ActivityName"))

    ########### "TEST" data 
    # get activity data and set column name    
    test_acti <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep=" ", header=FALSE)
    setnames(test_acti, c("Activity"))
    
    # get subject data and set column name        
    test_subject <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep=" ", header=FALSE)
    setnames(test_subject, c("SubjectNumber"))

    # get measurement data
    # without the separator
    test_meas <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt", header=FALSE)

    # add ID column to enable merge
    test_acti$ID <- seq.int(nrow(test_acti))
    test_subject$ID <- seq.int(nrow(test_subject))
    test_meas$ID <- seq.int(nrow(test_meas))

    # Merge     
    test_data <- merge(test_acti, test_subject, by="ID")
    
    # Merge combining above data with Measurements
    test_data <- merge(test_data, test_meas, by="ID")
    
    ########### "TRAINING" data 
    # get activity data and set column name    
    train_acti <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep=" ", header=FALSE)
    setnames(train_acti, c("Activity"))
    
    # get subject data and set column name        
    train_subject <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep=" ", header=FALSE)
    setnames(train_subject, c("SubjectNumber"))

    # get measurement data
    # without the separator
    train_meas <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt", header=FALSE)

    # add ID column to enable merge
    train_acti$ID <- seq.int(nrow(train_acti))
    train_subject$ID <- seq.int(nrow(train_subject))
    train_meas$ID <- seq.int(nrow(train_meas))

    # Merge     
    train_data <- merge(train_acti, train_subject, by="ID")
    
    # Merge combining above data with Measurements
    train_data <- merge(train_data, train_meas, by="ID")
    
    # get all data into one table, since the columns are the same
    all_data <- rbind(train_data, test_data)
    
    ##Part 2
    x <- data.frame(all_data[,3], rowMeans(all_data[,-3]))
    
    #Part 3, 4
    all_data$ActivityName <- ifelse (all_data$Activity == 1, "Walking",
                                     ifelse (all_data$Activity == 2, "Walking Upstairs",
                                     ifelse (all_data$Activity == 3, "Walking Downstairs",
                                     ifelse (all_data$Activity == 4, "Sitting",
                                     ifelse (all_data$Activity == 5, "Standing", "Laying")))))
                                     
    #Part 5
    out_data <- aggregate(all_data[, 4:564], list(all_data$ActivityName, all_data$SubjectNumber), mean)
    
    # set column names
    names(out_data)[1] <- "ActivityName"
    names(out_data)[2] <- "SubjectNumber"
    
    #sort by activyt name, subject number using dplyr arrange()
    out_data <- arrange(out_data, ActivityName, SubjectNumber)
    
    #write to file
    write.table(out_data, "TidyExerciseData.txt", row.names = FALSE)    
}
