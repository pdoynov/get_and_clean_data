# The code performs the five steps outlined in the Coursera course assignment.
# The data set has to be in uncompressed, unmodified form and in the current work
# directory and subdirectory as a result of the unzip operation of the original zip file.
# Author: PD, February 2015

setwd("C:/coursera3")
library(plyr)

#load the training dataset
dtTrain = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
dtTrain[,dim(dtTrain)[2]+1] = read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
dtTrain[,dim(dtTrain)[2]+1] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
#load the testing dataset
dtTest = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
dtTest[,dim(dtTest)[2]+1] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
dtTest[,dim(dtTest)[2]+1] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
# Merge training and test sets together
allData = rbind(dtTrain, dtTest)

#load the labels of activities
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
#load the features dataset
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

#modify the names; remove "-" and change to capital letter
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Get the columns with data on mean and std. dev. 
# and reduce the number of features to the features of interst
colsWeNeed <- grep(".*Mean.*|.*Std.*", features[,2]) 
features <- features[colsWeNeed,] 
# Now add the last two columns from the dataset: activity and subject
dtDim <- dim(allData)[2]
colsWeNeed <- c(colsWeNeed, dtDim - 1, dtDim) 
# Filter allData - remove the columns of data we don't need 
allData <- allData[,colsWeNeed] 
# Add descriptive variable names for the column in allData 
colnames(allData) <- c(features$V2, "Activity", "Subject") 
colnames(allData) <- tolower(colnames(allData)) 
currentActivity = 1 
for (currentActivityLabel in activityLabels$V2) 
{ 
    allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity) 
    currentActivity <- currentActivity + 1 
}
#change activity and subject to factor
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

#compute the average for all features of interest
averaged_data <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:dim(features)[1]]))

#write the proccesed data set as a new data set to a text file
write.table(averaged_data, "data_all_averaged.txt", sep="\t") 

#end of code