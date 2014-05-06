From the facets.txt file, we have all the facet names.So we read the facet.txt table, and try to filter out those facets and save them into facet to remove object
facetNames <- read.table("facet.txt")
facettoremove2 <- with(facetNames, facetNames[grepl("mean",V2) | grepl("std",V2),])
facettoremove$V1 <- gsub("()","",facettoremove $V2,fixed=TRUE)
facettoremove $V2 <- gsub("-",".",facettoremove $V2,fixed=TRUE)


read and parse the training data files 
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
x_train_removed <- x_train[,facettoremove$V1] get only the mean and std facets
names(x_train_removed) <- facettoremove$V2  assign the facets names
y_train <- read.table("y_train.txt")

trainingSet <- cbind(subject_train, rep("TRAIN",nrow(subject_train)), y_train,x_train_removed) 
colnames(trainingSet)[1] <- "subject"
colnames(trainingSet)[2] <- "data.type"
colnames(trainingSet)[3] <- "activity"


The same thing is done for the testing data files where train is replaced with test
merge training and test data frames

tidy1 <- merge(trainingSet,testingSet)
tidy1$activity <- as.factor(tidy1$activity)

tidy2 <- aggregate(tidy1[,-c(1:3)], by=list(factor(tidy1$subject),factor(tidy1$activity), factor(tidy1$data.type)),mean)


write.csv(tidy1,"tidy1.csv")
write.csv(tidy2,"tidy2.csv")
getwd()!="/Users/shimanga/Documents/Code/R/datasciencecoursera/data")
setwd("/Users/shimanga/Documents/Code/R/datasciencecoursera/data")





