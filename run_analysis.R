#This is an R script which performs the following actions:
#Merges the training/test files and creates one data set
#Extracts the mean and standard deviation for each measurement 
#Uses descriptive names for the activities
#Labels the data set with descriptive variable names 
#Creates a tidy data set with the mean of each variable for each activity and each subject

#Load required libraries
require(dplyr)

#if(!file.exists("./data")){dir.create("./data")}
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(fileUrl,destfile="./data/survey.csv",method="curl")
#survey <- read.csv("./data/survey.csv")

#Load the subjects from both training and test sets

sub_test <- read.table("./test/subject_test.txt")
sub_trai <- read.table("./train/subject_train.txt")

#Append both the test and train measurements, as are of same nature

msub <- rbind(sub_test, sub_trai)
#Add name to variable
colnames(msub) <- "Subject"

#Load the activities done by both training and test

ytest <- read.table("./test/y_test.txt")
ytrai <- read.table("./train/y_train.txt")

#Append both activities from training and test

acti <- rbind(ytest, ytrai)
#Add variable name to activities
colnames(acti) <- "Activity"

#Load the measurements done in the test and training data sets

X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")

#Append both the test and train measurements, as are of same nature
mdata <- rbind(X_test, X_train)

#Load the features to see which variables to keep

features <- read.table("./features.txt", quote="\"", stringsAsFactors=FALSE)

#Keep only the varibales where there is a mean or standard devation

tms <- features[(grepl("mean", features$V2) | grepl("std", features$V2)),]

#Clean up the features names, remove the firs t or f, and the parenthesis

tms$V2 <- gsub("t", "Time", tms$V2)
tms$V2 <- gsub("f", "Freq", tms$V2)
tms$V2 <- gsub("\\()", "", tms$V2)

#Take the appended measured data, ie train ad test, and subset only the mean and standard deviation

columnas <- tms$V1
mdata2 <- mdata[,columnas]

#Bring the labels of the variables and label the columns with this

ncolumnas <- tms$V2
colnames(mdata2) <- ncolumnas

#Merge all three elements the subjects, activities and mean, std measurements

mdata3 <- cbind(msub, acti, mdata2)

#Improve readibility of variables, change names
#Store names in vector
nombres <- colnames(mdata3)
#Use gsub to shape the names
nombres <- gsub("BodyBody", "Body", nombres)
nombres <- gsub("Mag", "Magnitude", nombres)
nombres <- gsub("sd", "StDev", nombres)
nombres <- gsub("Acc", "Acceleration", nombres)

#Add those names to varibales in data set

colnames(mdata3) <- nombres

#Change the activities from numbers to a descriptive name

#Load and read the activity labels file
activity_labels <- read.table("./activity_labels.txt", quote="\"")

#A function will go thorugh the vector and changing the names with descriptive ones

mgsub <- function(pattern, replace, x, ...) {
  if (length(pattern)!=length(replace)) {
    stop("The pattern and replacement have different length")
  }
  activities_2 <- x
  for (i in 1:length(pattern)) {
    activities_2 <- gsub(pattern[i], replace[i], activities_2, ...)
  }
  activities_2
}

#Use the functionm to do the replacement

mdata3$Activity <- mgsub(c("1", "2", "3", "4", "5", "6"), activity_labels$V2, mdata3$Activity)

#Write the tidy data set

write.table(mdata3, "Human_Activity_Recog_Smartphones.txt", sep = ",")

#After generating a more clear data set, finally create a tidy data set grouped by subject,
#which gives an average of each variable for each activity and each subject.
#Grouping
mdata_tidy <- group_by(mdata3, Subject, Activity)
#Summary
mdata_tidy_sum <- summarise_each(mdata_tidy, funs(mean))

#mdata_tidy <- mdata3 %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

#Write a table with the tidy data sets and the averages of variables of each subject

write.table(mdata_tidy_sum, "smartphone_tidy_data.txt", row.names=FALSE, sep=",")


