# initiation

library(data.table)
library(dplyr)
library(stringr)

#check if data is present. stop if data is missing.
if(!dir.exists("./UCI HAR Dataset")) {
        stop("UCI HAR Dataset is missing!")
} else {

#read class labels into data table MYAC
MYAC <- data.table::fread("./UCI HAR Dataset/activity_labels.txt", 
                          col.names = c("classnum", "activity"))
#removing underscores
MYAC <- MYAC[, lapply(.SD, str_replace, "_", " ")]
MYAC <- MYAC[, .(classnum = as.numeric(classnum), activity)]

#read features into data table MYFEAT
MYFEAT <- data.table::fread("./UCI HAR Dataset/features.txt",
                            col.names = c("colnum", "mtype"))

#get the row identifiers of wanted features(mean and std) into myvars 
#for extraction
myvars1 <- grep("[Mm][Ee][Aa][Nn]\\(\\)", MYFEAT$mtype)
myvars2 <- grep("[Ss][Tt][Dd]\\(\\)", MYFEAT$mtype)
myvars <- c(myvars1, myvars2)
myvars <- myvars[order(myvars)]



#reading test data
MYTESTX <- data.table::fread("./UCI HAR Dataset/test/X_test.txt")
#assigning proper names of columns
colnames(MYTESTX) <- MYFEAT$mtype


#reading test activity classes
MYTESTY <- data.table::fread("./UCI HAR Dataset/test/y_test.txt",
                             col.names = "classnum")


#reading test subject ids
MYTESTSUB <- data.table::fread("./UCI HAR Dataset/test/subject_test.txt",
                               col.names = "ID")


#gather the test data into one complete data table
MYTEST <- bind_cols(MYTESTSUB, MYTESTY, MYTESTX)
#clean cache
rm(MYTESTX, MYTESTY, MYTESTSUB)

#--------------------------
#equalizing wanted variables numbers
myvars <- myvars + 2 
myvars <- c(c(1,2), myvars)
#--------------------------


#reading training data
MYTRAINX <- data.table::fread("./UCI HAR Dataset/train/X_train.txt")
#assigning proper names of columns
colnames(MYTRAINX) <- MYFEAT$mtype


#reading test activity classes
MYTRAINY <- data.table::fread("./UCI HAR Dataset/train/y_train.txt",
                             col.names = "classnum")

#reading test subject ids
MYTRAINSUB <- data.table::fread("./UCI HAR Dataset/train/subject_train.txt",
                               col.names = "ID")


#gather the test data into one complete data table
MYTRAIN <- bind_cols(MYTRAINSUB, MYTRAINY, MYTRAINX)


#clean cache
rm(MYTRAINX, MYTRAINY, MYTRAINSUB)


#merge Data Tables into one complete table
MYDATA <- bind_rows(MYTRAIN, MYTEST)
#clean cache
rm(MYTRAIN, MYTEST)




#arrange according to ID and activity
MYDATA <- arrange(MYDATA, ID, classnum)


#extract only wanted info
MYDATAEXTRACT <- MYDATA[, myvars]

MYDATAEXTRACT <- as.data.table(MYDATAEXTRACT)

#merge activity names of classnum values
TDAT <- merge(MYDATAEXTRACT, MYAC, by = "classnum")

#drop unnecessary classnum column
TDAT <- TDAT[,2:69]

#convert to data.table
TDAT <- as.data.table(TDAT)

#clean cache
rm(MYAC, MYDATA, MYDATAEXTRACT, MYFEAT, myvars, myvars1, myvars2)



## SECOND INDEPENDENT DATA SET
# average of each variable for each activity and each subject
TDAT2 <- TDAT[, lapply(.SD, mean) , by = c("ID", "activity")]

write.table(TDAT2, file = "CP_solution.txt",row.name = FALSE)
} #if clause end.

