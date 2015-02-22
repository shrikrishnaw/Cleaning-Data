
#Working directory set to the folder having all the necessary files before starting to execute.
 
#Reading train data.

  train<-read.table("X_train.txt")
  trlabel<-read.table("y_train")  #Train labels
  strain<-read.table("subject_train.txt")
  
  #Reading test data.
  
  test<-read.table("X_test.txt")
  tlabel<-read.table("y_test.txt")  #test labels.
  stest<-read.table("subject_test.txt")
  
  # Merging begins
  
  subjData<-rbind(strain,stest)  #merges train and test subjects rowwise.
  actData<-rbind(trlabel,tlabel) #merges label data set row wise.
  featData<-rbind(train,test)    #merges features data row wise.
  
  names(subjData)<-c("subject") #proper names set.
  names(actData)<-c("activity")
  
  feat<-read.table("features.txt")
  names(featData)<-feat$V2
  
  # Merging columns of subject data and activity/label data. 
  dataCombine<-cbind(subjData,actData)
  data<-cbind(featData,dataCombine)
  
# Searching and extracting for mean and standard deviation.
  subdataFeaturesNames<-feat$V2[grep("mean\\(\\)|std\\(\\)", feat$V2)]
  selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
   
  # Subsetting data frame from selected labels.
  data<-subset(data,select=selectedNames)
  activityLabels <- read.table( "activity_labels.txt",header = FALSE)
  
  # Readable names given.
  names(data)<-gsub("^t", "time", names(data))
  names(data)<-gsub("^f", "frequency", names(data))
  names(data)<-gsub("Acc", "Accelerometer", names(data))
  names(data)<-gsub("Gyro", "Gyroscope", names(data))
  names(data)<-gsub("Mag", "Magnitude", names(data))
  names(data)<-gsub("BodyBody", "Body", names(data))
  
  # Writing the tidy data to a file.
  library(plyr)
  Data2<-aggregate(. ~subject + activity, data, mean)
  Data2<-Data2[order(Data2$subject,Data2$activity),]
  write.table(Data2, file = "tidydata.txt",row.name=FALSE)

