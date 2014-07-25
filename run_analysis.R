# The following command require the "UCI HAR Dataset" directory to be a subdirectory of "Project".
The setwd() command will need altering for the directory structure and is a Linux structure which probably needs changing for Windows.
setwd("~/Coursera/GettingCleaningData/Project")

# Read the Training dataset:
#    Read the subjects into a temporary data frame:
sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
#    Create a temporary vector of 7352 repetitions of "Training":
grp <- rep("Training", 7352)
#    Read the activity type into a temporary dtaframe:
act <- read.table("UCI HAR Dataset/train/y_train.txt")
#    Merge sub, grp & act into one dataframe:
train <- cbind(sub, grp, act)
#    Rename the columns:
names(train)[1:3] <- c("Subject", "Group", "Activity")
#    Rename the activity levels:
train$Activity <- factor(train$Activity, levels = c(1, 2, 3, 4, 5, 6), labels = c("Walk", "WalkUp", "WalkDown", "Sitting", "Standing", "Laying"))
#    Read in the training data, 7352 rows,by 561 columns:
trdat <- read.table("UCI HAR Dataset/train/X_train.txt")
#    Merge the data into the train dataframe:
train <- cbind(train, trdat)
#   Write the data to a file in the Project directory as a backup.
write.table(train, "train.txt", row.names = FALSE)

# Repeat for the test data.
#    Read the subjects into a temporary data frame:
sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
#    Create a temporary vector of 2947 repetitions of "Test":
grp <- rep("Test", 2947)
#    Read the activity type into a temporary dtaframe:
act <- read.table("UCI HAR Dataset/test/y_test.txt")
#    Merge sub, grp & act into one dataframe:
test <- cbind(sub, grp, act)
#    Rename the columns:
names(test)[1:3] <- c("Subject", "Group", "Activity")
#    Rename the activity levels:
test$Activity <- factor(test$Activity, levels = c(1, 2, 3, 4, 5, 6), labels = c("Walk", "WalkUp", "WalkDown", "Sitting", "Standing", "Laying"))
#    Read in the training data, 7352 rows,by 561 columns:
tstdat <- read.table("UCI HAR Dataset/test/X_test.txt")
#    Merge the data into the test dataframe:
test <- cbind(test, tstdat)
#   Write the data to a file in the Project directory as a backup.
write.table(test, "test.txt", row.names = FALSE)

# Combine the two data frames.
alldata <- rbind(test, train)
#   Write the data to a file in the Project directory as a backup.
write.table(alldata, "alldata.txt", row.names = FALSE)

#   Read in the modified features.txt file (space between line number and name replaced by "-"):
colnam <- readLines("UCI HAR Dataset/modfeatures.txt", -1)

#   Reduce the dataset to only those variables that contain either "mean" or
#   "std" (standard deviation) in their name:
red_data <- alldata[ , c(1:3, grep("mean|std", names(alldata)))]

#   Rename the column names of the dataframe:
names(red_data)[4:564] <- colnam

#   Rename the column names of the dataframe to give more meaningful names:
#      Create a vector of the names and modify this in several stages:
oldnames <- names(red_data)
newnames <- gsub("BodyBody", "Body", oldnames)
newnames <- gsub("X[0-9]*\\.", "", newnames)
newnames <- gsub("^t", "time", newnames)
newnames <- gsub("^f", "frequency", newnames)
newnames <- gsub("Acc", "Acceleration", newnames)
newnames <- gsub("Mag", "Magnitude", newnames)
colnames(red_data) <- newnames

#   Columns to take the mean of:
vars <- grep("mean|std", names(red_data))
#   Loop over the subjects and the activities & compute the mean of each column:
for (ss in 1:30){
  for (aa in 1:6){
    for (col in vars){
      red_data[red_data$Sub == ss & red_data$Act == aa, col] <- mean(red_data[red_data$Sub == ss & red_data$Act == aa, col])
    }
  }
}
#   Remove duplicated rows:
red_data <- unique(red_data)

#   Remove the Group column:
red_data <- red_data[ , -2]

#   Compute the means of each column for each pair of Subject  & Activity:
new <- as.data.frame.table(tapply(red_data[ , 3], list(red_data$Sub, red_data$Act), mean))
for (cc in 4:81){
  temp <- as.data.frame.table(tapply(red_data[ ,cc], list(red_data$Sub, red_data$Act), mean))
  temp <- temp[ , 3]
  new <- data.frame(new, temp)
}
colnames(new) <- names(red_data)


# Save the data frame:
write.table(new, "reducedDataFrame.txt")