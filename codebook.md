This file describes the variables, the data and the cleaning activity of the course project.

The dataset provided by Coursera was downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The current working directory is set to the folder containing this data before working.

In the run_analysis.r script,
train stores the data from X_train.txt
trlabel stores data from y_train.txt i.e the activity labels
strain stores data from subject_train.txt

Similarly,
test, tlabel, stest store data from X_test.txt, y_test.txt and subject_test.txt respectively.

subjData contains the merged data of strain and stest.
actData contains the merged data of trlabel and tlabel.
featData contains the merged data of train and test variables.

feat consists of data from text file called "features.txt"

dataCombine is the merged data of variables subjData and actData.
data contains column merged featData and dataCombine.

activityLabels consist of text data activity_labels.txt.

Data2 is the final tidy dataframe.

wriiten into tidydata.txt finally.


