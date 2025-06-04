# CodeBook.md

## Data Source
Original dataset from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description
The data contains readings from smartphone accelerometers and gyroscopes of subjects performing different activities.

## Steps Taken
1. Merged the training and test datasets into one.
2. Extracted measurements that included mean or standard deviation.
3. Applied descriptive activity names (e.g., WALKING, STANDING).
4. Labeled dataset with descriptive variable names.
5. Created a second tidy dataset containing the average of each variable for each activity and subject.

## Variables
- `subject`: ID of the subject (1-30)
- `activity`: Activity performed (WALKING, SITTING, etc.)
- Other columns: average of sensor signals (e.g., TimeBodyAccelerometerMeanX)

Only variables with "mean" and "std" in their names were included before summarization.
