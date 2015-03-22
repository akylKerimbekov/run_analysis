## Codebook

### Input

#### Raw data

Download from source ([link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip))
A full description is available at the site where the data was obtained (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
)

### Manipulations

 * In R Studio set the working directory to the downloaded directory 'setwd()'
 * Load library reshape2 'library(reshape2)'
 * Load the run_analysis.R script 'source(run_analysis.R)'

#### Description of run_analysis script

* variables
	1. subjectTest - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
	2. xTest - Test set
	3. yTest - Test labels.
	4. subjectTrain - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
	5. xTrain - Training set
	6. yTrain - Training labels
	7. feature - List of all features
	8. activityLabels - Links the class labels with their activity name
	9. means - Is result dataset

* procedure
	1. Read data from text files into data frames
	2. Merge test and train subject data.
	3. Merge test and train y data.
	4. Merge test and train x data.
	5. Merge datasets of subject, x and y data (results of datasets from 2,3,4).
	6. Subset only mean and stdv features.
	7. Calculate mean of group by subject and activity.
	8. Write results to the ExportData.txt file.
	

 ### Output

 Tidy data on file ExportData.txt