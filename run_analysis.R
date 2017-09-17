library(dplyr)

# read test dataset
test_set<-read.table("Dataset/test/X_test.txt")
# read subject_id of test dataset
test_sub<-read.table("Dataset/test/subject_test.txt")
# read activity_id of test dataset
test_act<-read.table("Dataset/test/y_test.txt")
# read training data set, subject_id, and activity_id
train_set<-read.table("Dataset/train/X_train.txt")
train_act<-read.table("Dataset/train/y_train.txt")
train_sub<-read.table("Dataset/train/subject_train.txt")

# join test data set with activity_id and subject_id
if (nrow(test_set) == nrow(test_sub) & nrow(test_set) == nrow(test_act)) {
  test<-cbind(test_sub,test_act,test_set)
}else{
  stop("test dataset row number doesnt match subject or activity rows")
}
# join training data set
if (nrow(train_set) == nrow(train_sub) & nrow(train_set) == nrow(train_act)) {
  train<-cbind(train_sub,train_act,train_set)
}else{
  stop("training data set row number does not match subject or activity rows")
}

# join test and training dataset
if (ncol(test) == ncol(train)) {
  dataset<-rbind(test,train)
}else{
  stop("test and training has different number of columns")
}

# read feature names
feature_names<-read.table("Dataset/features.txt", stringsAsFactors = F)
feature_names<-feature_names[,2]
# make column name more descriptive
## change first lettel f to freq.
feature_names<-sub('^f','freq.',feature_names)
## change first lettle t to time.
feature_names<-sub('^t','time.',feature_names)
## remove ()
feature_names<-gsub('[(|)]','',feature_names)
## change _ or - to .
feature_names<-gsub('[-|_]','.',feature_names)
## others misformat will not be in mean_std subset

# change column names of dataset with feature names, starting from 3nd columns
# 2nd column of feature_names is list of names
colnames(dataset)<-c("subjectID","activityID",feature_names)
# filter for column names with mean of std, assign to mean_std with first 2 columns
mean_std<-dataset[,c(1,2,grep("mean|std",colnames(dataset)))]

activity_names<-read.table("Dataset/activity_labels.txt", stringsAsFactors = F)

# add new column that using activity_id column value as index of activity_names
# 2nd column of activity_name is the string values
mean_std<-mutate(mean_std,activityID=activity_names[mean_std$activityID,2])
# rename
mean_std<-rename(mean_std, activity=activityID)
# write output file
write.table(mean_std, file="mean_std.txt", row.name=FALSE)

# group by subjects and activities, apply mean on grouped data
objects_by_activity<-group_by(mean_std,subjectID,activity) %>% summarise_all(funs(mean))
# write output file
write.table(objects_by_activity,file="object_by_activities.txt", row.name=FALSE)

