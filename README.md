Getting and Cleaning Data course project
========================================

Overview
--------
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project is for the Coursera course [Getting and Cleaning Data](https://class.coursera.org/getdata-033)

The data that is being tidied comes from UCI Machine Learning Respository and is phone sensor data collected from smart phones during different activities. The measurements are grouped by one of two result types, training and testing.

There are two datasets we want to calculate from the raw data. The first dataset is the mean and standard deviation of each measurement regardless of activity or result type. The second dataset is the mean of each measurement grouped by the activity and the result type.

How to Use
----------
To calculate the target datasets all you need to do is run the run_analysis.R file. This script will download the required raw datasets if there is not a data fold present and then clean the data and calculate the target datasets. The script will add three new variables in the global environment:
* phone.sensor.data : The tidied dataset
* variable.summary: The dataset that contains the mean and standard deviation for each measurement
* averages.grouped.by.activity.and.result.type: The dataset that contains the means of each measurement grouped by activity and result type.

The script doesn't automatically delete the data folder.

File Overview
-------------
* run_analysis.R: Script that runs all of the code required to get the target datasets.
* data_soure_handler.R: Script that downloads the raw data and reads the raw data into R
* data_cleaner.R: Script that tidies up the raw data
* statistics_logic.R: Script that calculates the target datasets using the tidied dataset