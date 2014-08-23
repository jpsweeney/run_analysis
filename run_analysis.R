## UCI HAR Dataset file downloadable from 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## must by in the working directory for this to work
xtr <- read.table("./UCI HAR Dataset/train/X_train.txt")
    ## reads in x train data dim 7352 x 561
ytr <- read.table("./UCI HAR Dataset/train/y_train.txt") 
    ## reads in y train data dim 7352 x 1
str <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
    ## reads in subject train data dim 7352 x 1
xts <- read.table("./UCI HAR Dataset/test/X_test.txt") 
    ## reads in x test data dim 2947 x 561
yts <- read.table("./UCI HAR Dataset/test/y_test.txt") 
    ## reads in y test data dim 2947 x 1
sts <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
    ## reads in subject test data dim 2947 x 1
a <- read.table("./UCI HAR Dataset/features.txt")
    ## gives features names
xdata <- rbind(xtr,xts) ## Combines test and train 
    ## x data dim 10299 x 561
ydata <- rbind(ytr,yts) ## Combines test and train 
    ## activity data dim 10299 x 1
sdata <- rbind(str,sts) ## Combines test and train 
    ## participant data dim 10299 x 1
means <- grep("mean", a$V2) ##indexes all mean features
stds <- grep("std", a$V2) ## indexes all std features
meanonly <- xdata[,c(means)] ## pulls only mean data 
    ## dim 10299 46
stdonly <- xdata[,c(stds)] ## pulls only std data
    ## dim 10299 33
meannames <- a$V2[means] ##names mean vectors
stnames <- a$V2[stds] ##names std vectors
lmeannames <- tolower(meannames) ## lower case meannames
lstnames <- tolower(stnames) ## lower case stnames
meannames2 <- gsub("mean", "", lmeannames) ## remove "mean"
stnames2 <- gsub("std", "", lstnames) ## remove "std"
getfirst <- function(x) {x[1]} ## gets first in list
getsecond <- function(x) {x[2]} ## gets second in list
meanfirst <- sapply(meannames2, getfirst) ## shorten name
stfirst <- sapply(stnames2, getfirst) ## shorten name
meanlists <- strsplit(meanfirst,"\\()") ## remove ()
stlists <- strsplit(stfirst,"\\()") ## remove ()
meanlists2 <- sapply(meanlists, getfirst)
stlists2 <- sapply(stlists, getfirst)
m <- sapply(meanlists, getfirst) 
o <- sapply(meanlists, getsecond)
n <- sapply(stlists, getfirst)  
p <- sapply(stlists, getsecond)
m1 <- paste(m,o,sep="")
n1 <- paste(n,p,sep="")
m2 <- gsub("-","",m1)
n2 <- gsub("-","",n1)
m3 <- gsub("NA","",m2)
n3 <- gsub("NA","",n2)
    ## previous lines  (28-51) scrub the column names 
colnames(meanonly) = m3 ## adds scrubbed mean colnames
colnames(stdonly) = n3 ## adds scrubbed std colnames
colnames(ydata) <- "activity"
colnames(sdata) <- "participant"
totalmean <- cbind(meanonly,ydata,sdata) ## adds participants 
    ## and activities
totalsd <- cbind(stdonly,ydata,sdata) ## adds participants
    ## and activities
answer <- function(num) {tapply(totalmean[,num],totalmean$participant,mean)}
meanmeanbyparticipant <- cbind(answer(1), answer(2), answer(3), answer(4)
    , answer(5), answer(6), answer(7), answer(8), answer(9),
    answer(10), answer(11), answer(12), answer(13), answer(14),
    answer(15), answer(16), answer(17), answer(18), answer(19), 
    answer(20), answer(21), answer(22), answer(23), answer(24),
    answer(25), answer(26), answer(27), answer(28), answer(29), 
    answer(30), answer(31), answer(32), answer(33), answer(34),
    answer(35), answer(36), answer(37), answer(38), answer(39),
    answer(40), answer(41), answer(42), answer(43), answer(44),
    answer(45), answer(46)) 
    ## gives means by participant for each variable dim 30x46
answer<- function(num) {tapply(totalmean[,num],totalmean$activity,mean)} 
meanmeanbyactivity <- cbind(answer(1), answer(2), answer(3), answer(4), 
    answer(5), answer(6), answer(7), answer(8), answer(9),
    answer(10), answer(11), answer(12), answer(13), answer(14),
    answer(15), answer(16), answer(17), answer(18), answer(19), 
    answer(20), answer(21), answer(22), answer(23), answer(24),
    answer(25), answer(26), answer(27), answer(28), answer(29), 
    answer(30), answer(31), answer(32), answer(33), answer(34),
    answer(35), answer(36), answer(37), answer(38), answer(39),
    answer(40), answer(41), answer(42), answer(43), answer(44),
    answer(45), answer(46)) 
    ## gives means by activity for each variable dim 6 x 46
answer<- function(num) {tapply(totalsd[,num],totalsd$participant,mean)}
meansdbyparticipant <- cbind(answer(1), answer(2), answer(3), answer(4), 
    answer(5), answer(6), answer(7), answer(8), answer(9),
    answer(10), answer(11), answer(12), answer(13), answer(14),
    answer(15), answer(16), answer(17), answer(18), answer(19), 
    answer(20), answer(21), answer(22), answer(23), answer(24),
    answer(25), answer(26), answer(27), answer(28), answer(29), 
    answer(30), answer(31), answer(32), answer(33))
    ## gives mean sds by participant for each variable dim 30x33
answer<- function(num) {tapply(totalsd[,num],totalsd$activity,mean)}
meansdbyactivity <- cbind(answer(1), answer(2), answer(3), answer(4), 
    answer(5), answer(6), answer(7), answer(8), answer(9),
    answer(10), answer(11), answer(12), answer(13), answer(14),
    answer(15), answer(16), answer(17), answer(18), answer(19), 
    answer(20), answer(21), answer(22), answer(23), answer(24),
    answer(25), answer(26), answer(27), answer(28), answer(29), 
    answer(30), answer(31), answer(32), answer(33)) 
    ## gives mean sds by activity for each variable dim 6 x 33
colnames(meanmeanbyparticipant) <- m3
colnames(meanmeanbyactivity) <- m3
colnames(meansdbyparticipant) <- n3
colnames(meansdbyactivity) <- n3
    ## four above apply clean colnames
a <- cbind(row.names(meanmeanbyparticipant), meanmeanbyparticipant)
b <- cbind(row.names(meanmeanbyactivity), meanmeanbyactivity)
c <- cbind(row.names(meansdbyparticipant), meansdbyparticipant)
d <- cbind(row.names(meansdbyactivity), meansdbyactivity)
meanmeanbyparticipant <- a
meanmeanbyacticity <- b
meansdbyparticipant <- c
meansdbyactivity <- d
write.table(meanmeanbyparticipant, file = 
    "meanmeansbyparticipant.txt", row.name = FALSE) ## dim 30x47
write.table(meanmeanbyactivity, file = 
    "meanmeansbyactivity.txt", row.name = FALSE) ## dim 6x47
write.table(meansdbyactivity, file = 
    "meansdbyactivity.txt", row.name = FALSE) ## dim 30x34
write.table(meansdbyparticipant, file = 
    "meansdbyparticipant.txt", row.name = FALSE) ## dim 6x34     
