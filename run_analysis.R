library(tidyverse)

# Read in data files
subject_test <- read_table("./data/test/subject_test.txt", col_names = FALSE)
x_test <- read_table("./data/test/X_test.txt", col_names = FALSE)
y_test <- read_table("./data/test/y_test.txt", col_names = FALSE)

subject_train <- read_table("./data/train/subject_train.txt", col_names = FALSE)
x_train <- read_table("./data/train/X_train.txt", col_names = FALSE)
y_train <- read_table("./data/train/y_train.txt", col_names = FALSE)

activity_labels <- read_table("./data/activity_labels.txt", col_names = FALSE)
features_labels <- read_table("./data/features.txt", col_names = FALSE)


# remove initial numeric from features label
features_labels <- features_labels %>%
        separate(X1, sep = " ", into = c("name", "feature")) %>%
        .[,"feature"]


# merge test and train data tables and rename columns 
subject <- bind_rows(subject_test, subject_train)
names(subject) <- "volunteer"

x <- bind_rows(x_test, x_train)
names(x) <- features_labels$feature

y <- bind_rows(y_test, y_train)
names(y) <- "activity"

data <- bind_cols(subject, y, x)


# Extract only measurements for mean and standard deviation
data <- select(data, "volunteer", "activity", contains("mean"), contains("std"), -contains("angle"), -contains("meanFreq"))


# tidy data by reshaping data to provide only one feature per observation
data <- data %>%
        gather("tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-std()", key = "variable", value = "measurement") #%>%

# tidy data by rename activities using meaningful activity labels
names(activity_labels) <- c("activity","activity_name")
activity_labels$activity_name <- tolower(activity_labels$activity_name)
data <- data %>%
        left_join(activity_labels, by = "activity") %>%
        select(-activity) %>%
        select(volunteer, activity_name, variable:measurement)


# Create final tidy data set average of each variable for each activity and each subject.
data_final <- data %>%
        group_by(volunteer, activity_name, variable) %>%
        summarize(average = mean(measurement))
        
write.table(data_final, "final_tidy_data.txt",row.names = FALSE)