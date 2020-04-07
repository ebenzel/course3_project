The tidy data file "final_tidy_data.txt" produced by the script "run_analysis.R" contains information on the following variables:

### volunteer
The variable `volunteer` contains integer value with value [1,30] indicating the identifyier of the subject who carried out the experiment

### activity_name
The variable `activity_name` used the file `activity_tabels.txt` in data to match a descriptive label to each activity in the data set. This variable contains a character string indicating which of the following six activities the measurement was taken during: 
*laying
*sitting
*standing
*walking
*walking_downstairs
*walking_upstairs

### variable
The variable `variable` contains character string indicating which of the 561 variables is measured. The name describes three dependent factors of the variable: the feature, the function (mean or standard deviation in this case), and the direction measured in (X, Y, or Z) using the following format: feature-function()-direction. Full list of variables can be found in features.txt in source files and more information regarding these variables can be found in features_info.txt

### average
The variable `average` contains the mean value of the normalized variable measurements grouped by volunteer, activity_name, and variable
