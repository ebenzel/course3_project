# The tidy data file "final_tidy_data.txt" producued by the script "run_analysis.R" contains information on the following variables:

## volunteer
### The variable contains integer value with value [1,30] indicating the participant in the study for which the data was collected

## activity_name
### This variable contains a character string indicating which of the following six activities the measurement was taken during: 
#### laying
#### sitting
#### standing
#### walking
#### walking_downstairs
#### walking_upstairs

## variable
### This variable contains character string indidcating which of the 561 variables is measured. The name describes three dependent factors of the variable: the feature, the function (mean or standard deviation in this case), and the direction measured in (X, Y, or Z) using the following format: feature-function()-direction. Full list of variables can be found in features.txt in source files and more information regarding these variables can be found in features_info.txt

## average
### This variable contains the mean value of the normalized variable measurements grouped by volunteer and activity_name