##read data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"activity_analysis.zip")
unzip("activity_analysis.zip")
col_names<-read.csv("./UCI HAR Dataset/features.txt",header = F,sep = "")
test_set<-read.csv("./UCI HAR Dataset/test/X_test.txt",header = F,sep = "")
test_subject<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header = F,sep = "")
test_activity<-read.csv("./UCI HAR Dataset/test/y_test.txt",header = F,sep = "")
train_set<-read.csv("./UCI HAR Dataset/train/X_train.txt",header = F,sep = "")
train_activity<-read.csv("./UCI HAR Dataset/train/y_train.txt",header = F,sep = "")
train_subject<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header = F,sep = "")
library(dplyr)

##Merges the training and the test sets to create one data set
test_all<-test_set %>%tbl_df %>%
        mutate(type="test",activity=unlist(test_activity),subject=unlist(test_subject))
train_all<-train_set %>%tbl_df %>%
        mutate(type="train",activity=unlist(train_activity),subject=unlist(train_subject))
run_all<-bind_rows(test_all,train_all)


##Extracts only the measurements on the mean and standard deviation for each measurement.
col_mean_std_Freq<-grep("mean()|std()",col_names[,2])
col_name_msf<-as.character(col_names[col_mean_std_Freq,2])
run_mean_std_Freq<-run_all %>% select(type:subject,col_mean_std_Freq)

##labels the data set with descriptive variable names.Removing meanFreq() columns
colnames(run_mean_std_Freq)<-c("type","activity","subject",col_name_msf)
run_mean_std<-select(run_mean_std_Freq,-contains("Freq"))

##Uses descriptive activity names to name the activities in the data set
activity_names<-c("walking","walking up","walking down","sitting","standing","laying")
for(n in 1:6){
        run_mean_std$activity[run_mean_std$activity==n]<-activity_names[n]
}
write.table(run_mean_std,"run_analysis.txt")

##Creat a data set containing the average of each variable for each activity and each subject
averages<-run_mean_std %>%group_by(activity,subject,type) %>% summarize_all(mean)
write.table(averages,"average_by_group.txt",row.name=FALSE)
