# GettingCleaningData README file 
Getting and cleaning data repository for making a tidy data set

The purpose of the project is to retrieve, and clean a data set which can be used for further analysis. 

The steps for the project include:

# Creation of an R script called run_analysis.R that does:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this Github repository you will find, the R script "run_analysis.R", the tidy data set with the means "smartphone_tidy_data.txt" and an a codebook "Code_Book.md"

The script was created and tested in RStudio in Ubuntu Linux and does the following actions:

Reads the subject labels, features and measurment data of test and training. It first appends each of test and training, of each, then it selecst the variables which have mean and standard deviation. It then rearranges the names of the variables for more descriptive names. And merges all data sets to produce a tidy data set, and writes it on a table as a txt, comma separated values, which is suitable for analysis. The file generated is named "Human_Activity_Recog_Smartphones.txt".

Finally it makes a summary using the mean for the variables mean and standard deviation. Grouped by subject and activity. It then writes a table, comma separated values, named: "smartphone_tidy_data.txt"

In the CodeBook.md there is information about the dataset and each of the variables and a more step by step actions about the code and how it performs.

To be able to read the uploaded file in the Coursera webpage, in R

smartphone_tidy_data <- read.csv("smartphone_tidy_data.txt")
View(smartphone_tidy_data)

To run it, one must The first step is to obtain the files withthe raw data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After downloading the file it is unzipped and a folder named "UCI_HAR_Dataset" is created. Then an R-scrip file "run_analysis.R" is copied to this folder.

For running it the working directory has to be set to the folder were the data is located "UCI_HAR_Dataset"

Then in R:

source("run_analysis.R")

More info about the dataset:

More info:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
