#
library(dplyr)
# First we obtain the data from the web and store it in a directory called data,
# which is in the working directory.
if (!file.exists("data")){
    dir.create("data")
}
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url,destfile = "data/wearable_data.zip")
# unzip("data/wearable_data.zip")
# he data is now in the directory"data/UCI HAR Dataset"
# Then we need to read the training data and its label, merge them. 
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
trainingset <- cbind(X_train, subject_train, y_train)
# Do same job on test data, merge the training and test dataset.
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
testset <- cbind(X_test, subject_test, y_test)
totaldata <- rbind(trainingset,testset)

# Get the feature names of the dataset, and name the `totaldata`.
featurename <- read.table("data/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
names(totaldata) <- c(featurename[,2], "subject", "label")
# Next we only extract the measurement on mean and std, whose names in the name 
# vector are lower case. Then we can extract our target data.
extractnames <- grep("mean|std",featurename[,2])
namedim <- length(names(totaldata))
extractdata <- totaldata[,c(extractnames,namedim-1,namedim)]

# Next we give the specific activity name to every observation. First we make a 
# data.frame to match the activity names and its number, which in the dataset
# is the variable label.
activityname <- data.frame(1:6,c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
names(activityname) <- c("label", "activity")
# Finally we can merge our data and it's label.
exdatawlabel <- merge(extractdata, activityname, by.x = "label",by.y = "label")
write.table(exdatawlabel, file = "data/cleandata.txt")

# Here we create a second dataset with the average of each variable for each 
# activity and each subject. Here we reserved the label variable, which serves as
# a control variable.
averagedata <- group_by(exdatawlabel,activity,subject) %>% summarise_all(mean,na.rm = TRUE)
write.table(averagedata, file ="data/averagedata.txt")
