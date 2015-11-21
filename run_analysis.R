#####################################################################
#This code was generated in a computer with the following parameters,
#Operating system - Windows 8.1
#System type      - 64-bit operating system, x64-based processor
#R version		- 3.2.2
#This code uses the UCI Human Activity Recognition Using Smartphones Data Set available at
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#or at
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#and outputs a tidy data set
#####################################################################

#Define Variables
Download<-TRUE   #Download should be set to FALSE if the data set is already residing in a subdirectory of the working directory
Unzip_file<-TRUE #Unzip_file should be set to FALSE if the data is already extracted from the zip file

#Download the file into a subdirectory called data
if(Download){
	if(!file.exists("./data")){dir.create("./data")}
	fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl,destfile="./data/HAR_Dataset.zip")
}

#Unzip the files
if(Unzip_file){
	unzip("./data/HAR_Dataset.zip",exdir="./data")
} 

#Load the files to R
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
features<-read.table("./data/UCI HAR Dataset/features.txt")
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

#Combine the subject identifiers, labels and features together
train<-cbind(subject_train,y_train,X_train)
test<-cbind(subject_test,y_test,X_test)

#Remove unnecessary variables
rm(subject_train,y_train,X_train,subject_test,y_test,X_test)

#Merge the training and the test sets to create one data set
data<-rbind(train,test)

#Remove unnecessary variables
rm(train,test)

#Name the columns
colnames(data)<-c("id","activity",as.character(features[,2]))

#Extracts only the measurements on the mean and standard deviation for each measurement
list<-c(1,2,grep("mean\\(\\)",names(data)),grep("std\\(\\)",names(data)))
select_data<-data[,sort(list)]

#Remove unnecessary variables
rm(data,features,list)

#Give descriptive activity names to name the activities in the data set
library(dplyr)
select_data<-merge(select_data,activity_labels,by.x="activity",by.y="V1")

#Reorder the columns of the data
select_data<-select_data[,c(2,69,3:68)]

#Appropriately label the data set with descriptive variable names

names<-names(select_data)
names[2]<-"activity"
names<-tolower(names)
names<-gsub("-","_",names)
names<-sub("\\(\\)","",names)
names<-sub("bodybody","body",names)
colnames(select_data)<-names

#Creates a tidy data set with the average of each variable for each activity and each subject
library(reshape2)
dataMelt<-melt(select_data,id=c("id","activity"),measure.vars=3:68)
tidy_data<-dcast(dataMelt,id+activity~variable,mean)

#Save the tidy data set
write.table(tidy_data,file="tidy_data.txt",row.name=FALSE,sep=" ",quote=FALSE)

