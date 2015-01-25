#Code Book

Getting and cleaning data Project

Below is a description of the code and description of an anlysis to generate a tidy data set for an specific source. The data was obtained from:

The Human Activity Recognition Using Smartphones Data Set a study where physical activities where recorded, using smartphones, for several subjects.

Below part of the information is taken from the README.txt of the original source:

Experimental design:
The experiments were done with 30 subjects (19-48 years). Each person did 6 activities, namely: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, while wearing a smartphone on the waist. Using its accelerometer and gyroscope, they recorded 3-axial linear acceleration and 3-axial angular velocity at a constant rate. The obtained dataset was divided into two sets.

For each record it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
<br>
Triaxial Angular velocity from the gyroscope. 
<br>
A 561-feature vector with time and frequency domain variables. 
<br>
Its activity label. 
<br>
An identifier of the subject who carried out the experiment.
<br>
More info:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The first step is to obtain the files withthe raw data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After downloading the file it is unzipped and a folder named "UCI_HAR_Dataset" is created. Then an R-scrip file "run_analysis.R" is copied to this folder.

For running it the working directory has to be set to the folder were the data is located "UCI_HAR_Dataset"

The script then first reads the data.

RAW data:

The data that was read was:

subject_text.txt<br>
subject_train.txt<br>
y_test.txt<br>
y_train.txt<br>
X_test.txt<br>
X_train.txt<br>
features.txt<br>
activiy_labels.txt<br>

Below is the description for each of the files used:

features.txt: List of all features or activities recorded.<br>
activity_labels.txt: Links the class labels with their activity name. Names of each activity.<br>
<br>
train/X_train.txt: Training set. Raw measurement data<br>
train/y_train.txt: Training labels.<br>
<br>
test/X_test.txt: Test set. Raw measurement data<br>
test/y_test.txt: Test labels.<br>
<br>
Variables:
<br>
Subject is variable containing the participants each one anonimyzed. It is of class integer from 0 to 30. The activity is a categorical variable of the activity performed by each of the participants, namely LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS.

The remaining variables are the mean and standard deviation for each activity carried by the subject. The data are normalized so don't have a unit.

Extracted features from original file		

<table>

<tr><td>tBodyAcc-mean()-X</td><td>	Column	1</td></tr>
<tr><td>tBodyAcc-mean()-Y	</td><td>Column	2</td></tr>
<tr><td>tBodyAcc-mean()-Z	</td><td>Column	3</td></tr>
<tr><td>tBodyAcc-std()-X	</td><td>Column	4</td></tr>
<tr><td>tBodyAcc-std()-Y	</td><td>Column	5</td></tr>
<tr><td>tBodyAcc-std()-Z	</td><td>Column	6</td></tr>
<tr><td>tGravityAcc-mean()-X	</td><td>Column	41</td></tr>
<tr><td>tGravityAcc-mean()-Y	</td><td>Column	42</td></tr>
<tr><td>tGravityAcc-mean()-Z	</td><td>Column	43</td></tr>
<tr><td>tGravityAcc-std()-X	</td><td>Column	44</td></tr>
<tr><td>tGravityAcc-std()-Y	</td><td>Column	45</td></tr>
<tr><td>tGravityAcc-std()-Z	</td><td>Column	46</td></tr>
<tr><td>tBodyAccJerk-mean()-X	</td><td>Column	81</td></tr>
<tr><td>tBodyAccJerk-mean()-Y	</td><td>Column	82</td></tr>
<tr><td>tBodyAccJerk-mean()-Z	</td><td>Column	83</td></tr>
<tr><td>tBodyAccJerk-std()-X	</td><td>Column	84</td></tr>
<tr><td>tBodyAccJerk-std()-Y	</td><td>Column	85</td></tr>
<tr><td>tBodyAccJerk-std()-Z	</td><td>Column	86</td></tr>
<tr><td>tBodyGyro-mean()-X	</td><td>Column	121</td></tr>
<tr><td>tBodyGyro-mean()-Y	</td><td>Column	122</td></tr>
<tr><td>tBodyGyro-mean()-Z	</td><td>Column	123</td></tr>
<tr><td>tBodyGyro-std()-X	</td><td>Column	124</td></tr>
<tr><td>tBodyGyro-std()-Y	</td><td>Column	125</td></tr>
<tr><td>tBodyGyro-std()-Z	</td><td>Column	126</td></tr>
<tr><td>tBodyGyroJerk-mean()-X	</td><td>Column	161</td></tr>
<tr><td>tBodyGyroJerk-mean()-Y	</td><td>Column	162</td></tr>
<tr><td>tBodyGyroJerk-mean()-Z	</td><td>Column	163</td></tr>
<tr><td>tBodyGyroJerk-std()-X	</td><td>Column	164</td></tr>
<tr><td>tBodyGyroJerk-std()-Y	</td><td>Column	165</td></tr>
<tr><td>tBodyGyroJerk-std()-Z	</td><td>Column	166</td></tr>
<tr><td>tBodyAccMag-mean()	</td><td>Column	201</td></tr>
<tr><td>tBodyAccMag-std()	</td><td>Column	202</td></tr>
<tr><td>tGravityAccMag-mean()	</td><td>Column	214</td></tr>
<tr><td>tGravityAccMag-std()	</td><td>Column	215</td></tr>
<tr><td>tBodyAccJerkMag-mean()	</td><td>Column	227</td></tr>
<tr><td>tBodyAccJerkMag-std()	</td><td>Column	228</td></tr>
<tr><td>tBodyGyroMag-mean()	</td><td>Column	240</td></tr>
<tr><td>tBodyGyroMag-std()	</td><td>Column	241</td></tr>
<tr><td>tBodyGyroJerkMag-mean()	</td><td>Column	253</td></tr>
<tr><td>tBodyGyroJerkMag-std()	</td><td>Column	254</td></tr>
<tr><td>fBodyAcc-mean()-X	</td><td>Column	266</td></tr>
<tr><td>fBodyAcc-mean()-Y	</td><td>Column	267</td></tr>
<tr><td>fBodyAcc-mean()-Z	</td><td>Column	268</td></tr>
<tr><td>fBodyAcc-std()-X	</td><td>Column	269</td></tr>
<tr><td>fBodyAcc-std()-Y	</td><td>Column	270</td></tr>
<tr><td>fBodyAcc-std()-Z	</td><td>Column	271</td></tr>
<tr><td>fBodyAccJerk-mean()-X	</td><td>Column	345</td></tr>
<tr><td>fBodyAccJerk-mean()-Y	</td><td>Column	346</td></tr>
<tr><td>fBodyAccJerk-mean()-Z	</td><td>Column	347</td></tr>
<tr><td>fBodyAccJerk-std()-X	</td><td>Column	348</td></tr>
<tr><td>fBodyAccJerk-std()-Y	</td><td>Column	349</td></tr>
<tr><td>fBodyAccJerk-std()-Z	</td><td>Column	350</td></tr>
<tr><td>fBodyGyro-mean()-X	</td><td>Column	424</td></tr>
<tr><td>fBodyGyro-mean()-Y	</td><td>Column	425</td></tr>
<tr><td>fBodyGyro-mean()-Z	</td><td>Column	426</td></tr>
<tr><td>fBodyGyro-std()-X	</td><td>Column	427</td></tr>
<tr><td>fBodyGyro-std()-Y	</td><td>Column	428</td></tr>
<tr><td>fBodyGyro-std()-Z	</td><td>Column	429</td></tr>
<tr><td>fBodyAccMag-mean()	</td><td>Column	503</td></tr>
<tr><td>fBodyAccMag-std()	</td><td>Column	504</td></tr>
<tr><td>fBodyBodyAccJerkMag-mean()	</td><td>Column	516</td></tr>
<tr><td>fBodyBodyAccJerkMag-std()	</td><td>Column	517</td></tr>
<tr><td>fBodyBodyGyroMag-mean()	</td><td>Column	529</td></tr>
<tr><td>fBodyBodyGyroMag-std()	</td><td>Column	530</td></tr>
<tr><td>fBodyBodyGyroJerkMag-mean()	</td><td>Column	542</td></tr>
<tr><td>fBodyBodyGyroJerkMag-std()	</td><td>Column	543</td></tr>

</table>

This variables names were transformed to make it more readable and suitable for processing:

To each "t", which means time was modified for "Time"
To each "f", which frequency time was modified for "Freq"
Parenthesis were removed
Mag for Magnitude
Acc for Acceleration
Gyro is the gyroscope
sd for StDev, standard deviation

The code reads the subject labels, features and measurment data of test and training. It first appends each of test and training, of each, then it selecst the variables which have mean and standard deviation. It then rearranges the names of the variables for more descriptive names. And merges all data sets to produce a tidy data set, and writes it on a table as a txt, comma separated values, which is suitable for analysis. The file generated is named "Human_Activity_Recog_Smartphones.txt".

Finally it makes a summary using the mean for the variables mean and standard deviation. Grouped by subject and activity. It then writes a table, comma separated values, named: "smartphone_tidy_data.txt"




