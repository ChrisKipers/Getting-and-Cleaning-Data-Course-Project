Codebook for Getting and Cleaning Data course project
=====================================================

Overview
--------
This document describes the process of getting and transforming data, and the name and structure of the output variables.

### Getting Data
Files are download as a zip from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Once the files are downloaded the six relevant files are loaded into R memory. The six files are:
* activity_labels.txt: This file contains the id and labels for the activies the measurements correspond to
* features.txt: The column names for the testing and training x data
* test/X_test.txt: The measurements for the test data
* text/y_test.txt: The activity for each row of the x test data
* train/X_train.txt: The measurements for the training data
* train/y_train.txt: The activity for each row of the x train data

### Transforming Data
The data is tidied by applying the following transformations in order:
* The vector from features.txt is row bound to the dataframe from test/X_test.txt as test/X_test.txt header to form the dataset x_test(1)
* The vector from test/y_test.txt is column bound to x_test(1) to form test_data. This new dataframe has the activity id in each row.
* The dataframe from activities_labels.txt is joined with test_data by activity id. This forms a new dataframe test_data_with_activity_labels
* The vector from features.txt is row bound to the dataframe from train/X_train.txt as train/X_train.txt header to form the dataset x_train(1)
* The vector from train/y_train.txt is column bound to x_train(1) to form train_data. This new dataframe has the activity id in each row.
* The dataframe from activities_labels.txt is joined with train_data by activity id. This forms a new dataframe train_data_with_activity_labels
* A column with values 'testing' is column bound to the test_data_with_activity_labels. This forms a new dataframe, complete_test_data, with a column in each row indicating the result type is testing.
* A column with values 'training' is column bound to the train_data_with_activity_labels. This forms a new dataframe, complete_training_data, with a column in each row indicating the result type is training.
* The dataframe complete_test_data is row bound with the dataframe complete_training_data producing a single dataframe with all rows from complete_test_data and complete_training_data. The name of the new dataframe is tidied_phone_sensore_measurements.

The tidied_phone_sensore_measurements dataframe is then transformed into a dataframe called variable_summary. variable_summary contains the mean and standard deviations for each measurement. Transformation to get variable_summary:
* Calculate the means for every measurement in tidied_phone_sensore_measurements into a vector called means
* Calculate the standard deviation for every measurement in tidied_phone_sensore_measurements into a vector called standard.deviation
* Calculate the names of all measurements in tidied_phone_sensore_measurements into a vector called measurement_names
* Create the dataframe variable_summary by row binding means, standard.deviations and measurement_names
* Set the column names of variable_summary to a vector containing the strings 'variable', 'mean', and 'standard.deviation'

The format of the variable_summary data frame is:

| Column Name        | Type   |
|--------------------|--------|
| variable           | factor |
| mean               | real   |
| standard.deviation | real   |


The tidied_phone_sensore_measurements dataframe is then transformed the dataframe averages_grouped_by_activity_and_result_type. This dataframe contains the average for a variable based on the group it was in and the activity it was for. Transformation to get averages_grouped_by_activity_and_result_type:
* Group averages_grouped_by_activity_and_result_type by activity and result type.
* Summarize the mean for each measurement in the grouped dataframe
* Gather the results of the summarization by the measurement fields, setting the key to 'measurement' and the value to 'mean'

The format of the averages_grouped_by_activity_and_result_type dataframe is:

| Column Name | Type   |
|-------------|--------|
| activity    | factor |
| result.type | factor |
| measurement | factor |
| mean        | real   |

