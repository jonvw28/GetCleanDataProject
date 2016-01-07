# Getting and Cleaning Data Project  
### Jonathan Williams

This repository contains all of my work for the Coursera Getting and Cleaning Data course project. This includes:  
* the raw data used for the project  
* 2 tidy data sets created in the project  
* R code to get the tidy data from the raw data
* a code book for the tidy data  
* this read me

The raw data comes from a UCI dataset about tracking the movement of 30 individuals during 6 different activities. More information about this data set can be found in the sub-dirrctory /Raw Data. The raw data used is all in here and the files readme.txt and features.txt here explain what it all represents.

The tidy data sets I created are included here as tidyx.txt and summarydata.txt

* **tidyx.txt** is created from the raw data by first combining the training and test sets to collect all the data in one data set. From this, only the features representing the estimated mean and standard deviation of the original measurements are kept. These are then labelled in the tidy data set, using more readable descriptions. Finally, the  subject id and the activity labels are added to the dataset as these are considered variables of each observation and so required in the data set to make it tidy. The activity labels are also adjusted to be descriptive rather than numerical. This final file is then included here as tidyx.txt

* **summarydata.txt** a summary data set created from tidyx.txt. Here the variables are all summarised. The mean of each variable is given for each activity and subject. The variable names are also updated to correctly reflect this summarisation. This final tidy data set is included as summarydata.txt

Additionally, a code book for these tidy datasets is included which explains in detail the origin of the data. It then contains a description of each variable included in both tidyx.txt and summarydata.txt. This is included as  CodeBook.md

### R Code

In order for this data analysis to be reproducible, the R code used to perform the analysis is included as run_analysis.R. In order to re-run the data analysis you should first fork this repository and clone it locally. Then, using R, you should set your working directory to be GetCleanDataProject. From here you should run the script run_analysis.R. This will then load the raw data, perform the analysis outlined above, and save the resulting data sets as tidtx.txt and summarydata.txt

## Contents

* **tidyx.txt** A tidy dataset containing the tidied data set described above  
* **summarydata.txt** The summarised dataset of tidyx, as described above  
* **CodeBook.md** A code Book describing the two data sets above  
* **Raw Data** A subdirectory containing the raw data for this project
* **README.md** This markdown document explaining this repository

Jonathan Williams 2016