# Codebook

## Part 1
1. Read the acvitity "lookup" data into dat_acti
2. Set column name to a descriptive value

### For "test" data
1. Read the subject data, measurment data and activity data into data tables
2. Set column names to a descriptive values for subject and activity data
3. Add an sequential ID column to each data table to enable data merging
4. Merge the three data tables into one "test_data" table

### For "training" data
1. Repeat steps 1-4 above for the training data, and get merged data into "training_data" table

### Merge test and training data
1. As the columns are similar in both the test and training data set, combine data using rbind(test_data, training_data) into "all_data"

## Part 2
1. Caculate mean and std. deviation for each row using the rowMeans() and sd() function on all measurement columns 

## Part 3, 4
1. Using the ifelse() function, add a new column "ActivityName" to the combined "all_data" depending on the activity label
