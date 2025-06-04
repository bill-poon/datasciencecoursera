# 1. Load required libraries
library(dplyr)

# 2. Download and unzip data if not already present
filename <- "dataset.zip"
if (!file.exists(filename)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

# 3. Read all data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# 4. Merge training and test sets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

# 5. Extract only mean and std measurements
tidy_data <- merged_data %>%
  select(subject, code, contains("mean"), contains("std"))

# 6. Use descriptive activity names
tidy_data$code <- activities[tidy_data$code, 2]
names(tidy_data)[2] <- "activity"

# 7. Label dataset with descriptive variable names
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

# 8. Create tidy data set with average of each variable for each activity and each subject
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 9. Save output
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)

