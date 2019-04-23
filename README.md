# GCD_CP
Course Project

The R script run_analysis.R checks if the UCI HAR Dataset is present in the 
workspace. If so, it runs the script doing the following:

1)Merges the training and the test sets to create one data set.

2)Extracts only the measurements on the mean and standard deviation for each measurement.

3)Uses descriptive activity names to name the activities in the data set

4)Appropriately labels the data set with descriptive variable names.

5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Resulting Data Table Explanation

#TDAT
Tidy Data(TDAT) Column Values:
 1:                          ID
 2:           tBodyAcc-mean()-X
 3:           tBodyAcc-mean()-Y
 4:           tBodyAcc-mean()-Z
 5:            tBodyAcc-std()-X
 6:            tBodyAcc-std()-Y
 7:            tBodyAcc-std()-Z
 8:        tGravityAcc-mean()-X
 9:        tGravityAcc-mean()-Y
10:        tGravityAcc-mean()-Z
11:         tGravityAcc-std()-X
12:         tGravityAcc-std()-Y
13:         tGravityAcc-std()-Z
14:       tBodyAccJerk-mean()-X
15:       tBodyAccJerk-mean()-Y
16:       tBodyAccJerk-mean()-Z
17:        tBodyAccJerk-std()-X
18:        tBodyAccJerk-std()-Y
19:        tBodyAccJerk-std()-Z
20:          tBodyGyro-mean()-X
21:          tBodyGyro-mean()-Y
22:          tBodyGyro-mean()-Z
23:           tBodyGyro-std()-X
24:           tBodyGyro-std()-Y
25:           tBodyGyro-std()-Z
26:      tBodyGyroJerk-mean()-X
27:      tBodyGyroJerk-mean()-Y
28:      tBodyGyroJerk-mean()-Z
29:       tBodyGyroJerk-std()-X
30:       tBodyGyroJerk-std()-Y
31:       tBodyGyroJerk-std()-Z
32:          tBodyAccMag-mean()
33:           tBodyAccMag-std()
34:       tGravityAccMag-mean()
35:        tGravityAccMag-std()
36:      tBodyAccJerkMag-mean()
37:       tBodyAccJerkMag-std()
38:         tBodyGyroMag-mean()
39:          tBodyGyroMag-std()
40:     tBodyGyroJerkMag-mean()
41:      tBodyGyroJerkMag-std()
42:           fBodyAcc-mean()-X
43:           fBodyAcc-mean()-Y
44:           fBodyAcc-mean()-Z
45:            fBodyAcc-std()-X
46:            fBodyAcc-std()-Y
47:            fBodyAcc-std()-Z
48:       fBodyAccJerk-mean()-X
49:       fBodyAccJerk-mean()-Y
50:       fBodyAccJerk-mean()-Z
51:        fBodyAccJerk-std()-X
52:        fBodyAccJerk-std()-Y
53:        fBodyAccJerk-std()-Z
54:          fBodyGyro-mean()-X
55:          fBodyGyro-mean()-Y
56:          fBodyGyro-mean()-Z
57:           fBodyGyro-std()-X
58:           fBodyGyro-std()-Y
59:           fBodyGyro-std()-Z
60:          fBodyAccMag-mean()
61:           fBodyAccMag-std()
62:  fBodyBodyAccJerkMag-mean()
63:   fBodyBodyAccJerkMag-std()
64:     fBodyBodyGyroMag-mean()
65:      fBodyBodyGyroMag-std()
66: fBodyBodyGyroJerkMag-mean()
67:  fBodyBodyGyroJerkMag-std()
68:                    activity

#TDAT2
Average of each variable for each activity and each subject