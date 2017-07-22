# Code Book

## Variables
* type: contains information which data set is this observation collected from(test or train).
* activity: contains information which activity is performed when this collected.
* subject: Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

##Data & Transformation
* col_names: Data read from features
* test_set: Data read from test set
* train_set: Data read from training set
* test/train_subject_train: Data read from subject_test/train
* test/train_activity: Data read from y_test/train
* test/train_all: Dataset which combines the test/train set, subject and activity
* run_all: Dataset which combines test_all and train_all
* col_mean_std_Freq: Integer vector which indicate the location of measurements of mean,std and meanFreq
* col_name_msf: Variable names that contains mean,std and meanFreq
* run_mean_std_Freq: Data subseted from run_all using col_mean_std_Freq as locator
* run_mean_std: Data subseted from run_all.This dataset is obtained by removing meanFreq() columns from run_mean_std_Freq
* activity_names: descriptive names of activity
* averages: Data set with the average of each variable for each activity and each subject
