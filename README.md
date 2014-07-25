GettingCleaningData ===================

Coursera: Getting &amp; Cleaning Data Course Project.

## Files.

The files in this repository should be:
1. This README.md file;
2. An R script entiteled run_analysis.R;
3. A codebook, entitled codebook.md.

## Introduction.

The codebook describes the variables in the reduced dataset which has been copied as a text file (reducedDataFrame.txt) to the
Assignment page where it appears as a link entitled "reducedDataFrame".

In order to reproduce the process by which I cleaned the original dataset [1] the R script run_analysis.R should be run either in R or Rstudio using
the command "source("run_analysis.R".
I copied the original datafile directory, "UCI HAR dataset", downloaded from the course website as a subdirectory of my "Project" directory.
When run the script will produce a file called
reducedDataFrame.txt with 180 rows and 81 columns, reduced from the original 10299 rows and 564 columns (when combined).

## Explanation.

The original data comprised a training set and a test set, each with 561 variables. These variables were measurements taken on thirty subjects who
performed six different types of activity (Walking, Walking up stairs, Walking Down stairs, Sitting, Standing and Laying down. the project brief was
to reduce this dataset to the means of all the variables that were either mean readings, with the word "mean" in their name, or standard deviations,
with "std" in their name. There is some latitude in the interpretation of which variables were mean reading and I chose the widest interpretaion to
get 79 variables measured against Subkject and Activity to give 81 columns.

## References.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass
Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
