## run_analysis.R script description

The script run_analysis.R reads in a variety of data files provided by the Human Activity Recognition Using Smartphones Dataset and produces a tidy data set with the average of each variable in the subset of mean and standard deviation measures for each activity and each subject. 

Note, the final data set is tidy becuase each row contains a single observation on four variables: volunteer, activity_name, variable, and average. 

-----------------------------------

The script first reads in the .txt files subject, x, and y for each the test and training subsets. the subject file is a single variable indicating the subject who carried out the experiment. The y file contains measurements on each of 561 variables for each subject in the subject vector. The y file contains a single vector indicating code for the activity during which the measurement was taken. Finally the files "activity_labels.txt" (containing labels for each of the 6 activity codes) and "features_labels.txt" (containing labels for each of the 651 columns in x) are read. 

First the three x, y, and subject tables from test (2947 observations) and train (7352 observations) are combined to form three tables of 10299 observations each. 

The three tables are combined to form a single table with 563 variables and 10299 observations. Columns are renamed to be meaningfully labeled. 

Per the project instructions, only variables measuring mean() and std() are selected from the initial data set.Then the data is tidied by reshaping to provide just one variable measurement per observation.

The activity column is replaced by an equivalent column with more descriptive labels 

Finally, the script groups the newly tidied data by volunteer, activity_name, and variable and then summarizes each group by its mean. A script to view the resulting data table is shown below. 

```r
address <- "http://coursera-assessments.s3.amazonaws.com/assessments/1586222093703/4bc90c21-4b4b-4da4-f65e-c9103438ae9b/final_tidy_data.txt"
data <- read.table(url(address), header = TRUE)
View(data)
```
