
    # set library
    library(reshape2)
    
    # read and initiate datasets
    subjectTest <- read.table("./test/subject_test.txt")
    xTest <- read.table("./test/X_test.txt")
    yTest <- read.table("./test/y_test.txt")
    
    subjectTrain <- read.table("./train/subject_train.txt")
    xTrain <- read.table("./train/X_train.txt")
    yTrain <- read.table("./train/y_train.txt")
    
    feature <- read.table("./features.txt")
    activityLabels <- read.table("./activity_labels.txt")
    
    # merge subject
    subject <- rbind(subjectTest, subjectTrain)
    colnames(subject) <- "subject"
    
    # merge label
    label <- rbind(yTest, yTrain)
    label <- merge(label, activityLabels, by=1)[,2]
    
    # merge main dataset
    data <- rbind(xTest, xTrain)
    colnames(data) <- feature[, 2]
    
    # merge all 3 datasets
    all <- cbind(subject, label, data)
    
    search <- c(1, 2, grep("-mean|-std", colnames(all)))
    allMeanStd <- all[,search]
    
    # group by subject/label and calculate mean
    melted = melt(allMeanStd, id.var = c("subject", "label"))
    means = dcast(melted , subject + label ~ variable, mean)
    
    # export final data
    write.table(means, file="./ExportData.txt")
    
    # output
    means