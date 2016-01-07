# This code take the raw UCI dataset and combines the training and test sets
# to create a single dataset. It then merges the subject ids and activity labels
# for each pattern. Then it selects only the variables that represent estimates
# of the mean and standard deviation of the recorded variables. In line with the
# principles of tidy data, the variable names are then made more readable. This
# data set is then saved as tidyx.txt.
#
# A second dataset is then created by summarising the new tidy data set. Here
# the mean of each variable is calculated for each activity and subject. 
# The variable names are updated to reflect this summarisation and the second
# data set is saved as summarydata.txt
#
# NOTE
# All reading in assumes that the working directory is "../GetCleanDataProject"
#
# Ensure necessary libraries are loaded
#
library(dplyr)
#
# Read in the data, labels and subject information for the training set
#
path <- "./Raw Data/train"
filename <- "X_train.txt"  
X_Train <- read.table(file = file.path(path,filename))
filename <- "y_train.txt"
y_Train <- read.table(file = file.path(path,filename))
filename <- "subject_train.txt"
subject_Train <- read.table(file = file.path(path,filename))
#
# Read in the data, labels and subject information for the test set
#
path <- "./Raw Data/test"
filename <- "X_test.txt"  
X_Test <- read.table(file = file.path(path,filename))
filename <- "y_test.txt"
y_Test <- read.table(file = file.path(path,filename))
filename <- "subject_test.txt"
subject_Test <- read.table(file = file.path(path,filename))
rm(path)
#
# combine data sets and remove raw data
#
X <- bind_rows(X_Train,X_Test) %>%
        tbl_df
y <- bind_rows(y_Train,y_Test) %>%
        tbl_df
subject  <- bind_rows(subject_Train,subject_Test) %>%
        tbl_df
rm(X_Train, X_Test, y_Train, y_Test, subject_Train, subject_Test)
#
# Load variable labels and merge to data set
#
path <- "./Raw Data"
filename <- "features.txt"
features <- read.table(file = file.path(path,filename))
colnames(X) <- features[,2]
rm(features,filename)
#
# Select only the variables representing means or standard deviations
# Note: need to filter out variable with meanFreq in their name
#
index <- grep("mean|std",colnames(X))
exclude <- grep("meanFreq",colnames(X))
TidyX <- X[,index[!is.element(index,exclude)]]
rm(index,exclude,X)
#
# Append data table with subject IDs and activity label as these are variables
#
TidyX <- bind_cols(subject, y, TidyX)
rm(y,subject)
colnames(TidyX)[1:2] <- c("subject","activity")
#
# Alter actvity labels to descriptive labels
#
path <- "./Raw Data"
filename <- "activity_labels.txt"
Activitylab <- read.table(file = file.path(path,filename),
                          stringsAsFactors = FALSE)[,2] %>%
        gsub("_", " ",.) %>%
        tolower %>%
        as.factor
TidyX <- mutate(TidyX, activity = Activitylab[TidyX$activity])
rm(Activitylab,path,filename)
#
# Tidy up variable names
#
colnames(TidyX) <- colnames(TidyX) %>%
        gsub("^t","time domain ",.) %>%
        gsub("^f","frequency domain ",.) %>%
        gsub("BodyBody","Body",.)%>%
        gsub("Body","body ",.)%>%
        gsub("Gravity","gravity ",.)%>%
        gsub("Acc","acceleration ",.)%>%
        gsub("Gyro","gyroscope ",.)%>%
        gsub("Jerk","jerk ",.)%>%
        gsub("Mag\\-mean\\(\\)","mean of magnitude",.) %>%
        gsub("Mag\\-std\\(\\)","standard deviation of magnitude",.)%>%
        gsub("\\-mean\\(\\)\\-X","mean in x direction",.) %>%
        gsub("\\-mean\\(\\)\\-Y","mean in y direction",.) %>%
        gsub("\\-mean\\(\\)\\-Z","mean in z direction",.) %>%
        gsub("\\-std\\(\\)\\-X","standard deviation in x direction",.) %>%
        gsub("\\-std\\(\\)\\-Y","standard deviation in y direction",.) %>%
        gsub("\\-std\\(\\)\\-Z","standard deviation in z direction",.)
#
# Save this Tidy Data Set
#
write.table(TidyX, file = "tidyx.txt", quote = FALSE)
#
# Create new data set where variables are averaged by activity and subject
#
sumTidyX <- TidyX %>%
        group_by(activity,subject) %>%
        summarise_each(funs(mean))
#
# Adjust names of new data set
#
temp <- length(colnames(sumTidyX))
avg <- rep("average", times = (temp - 2))
colnames(sumTidyX)[3:temp] <- paste(avg, colnames(sumTidyX)[3:temp], sep=" ")
rm(temp,avg)
#
# Save this new data set
#
write.table(sumTidyX, file = "summarydata.txt",quote = FALSE, row.names = FALSE)
