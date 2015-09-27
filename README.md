## "Getting and Cleaning data" Course project 

The run_analysis.R file is the source file that contains all the scripts needed for this assignment. This file contains  source code comments describing the function usage.

## Part 1
1. Read the activity "lookup" data into data table: dat_acti
2. Set column name to a descriptive value: ActivityName

### For "test" data
1. Read the subject data, measurment data and activity data into data tables- test_subject, test_meas, and test_acti resp. 
2. Set column names to a descriptive values for subject (SubjectNumber) and activity (Activity) data
3. Add an sequential ID column to each data table to enable data merging
4. Merge the three data tables into one "test_data" table, using the ID column

### For "training" data
1. Read the subject data, measurment data and activity data into data tables- train_subject, train_meas, and train_acti resp. 
2. Set column names to a descriptive values for subject (SubjectNumber) and activity (Activity) data
3. Add an sequential ID column to each data table to enable data merging
4. Merge the three data tables into one "train_data" table, using the ID column

### Merge test and training data
1. As the columns are similar in both the test and training data set, combine data using rbind(test_data, training_data) into "all_data"

## Part 2
1. Caculate mean and std. deviation for each row using the rowMeans() and sd() function on all measurement columns 

## Part 3, 4
1. Using the ifelse() function, add a new column "ActivityName" to the combined "all_data" depending on the activity label

## Part 5
1. Using the aggregate() function, compute the average of measurements for each subject and activity in the "all_data" data table
