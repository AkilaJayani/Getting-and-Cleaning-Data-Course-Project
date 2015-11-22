#Getting and Cleaning Data Course - Coursera - Project

This repo is concerned with taking the raw  Human Activity Recognition database made available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and converting it to a tidy data set.

This repo contains the following files

* run_analysis.R - R script for performing the analysis
* CodeBook.md - code book that describes the study design, raw and tidy data variables and transformations that were performed to tidy up the data
 
## run_analysis.R
R script that was used to transform the raw data to tidy data is given in this file. User needs to set two variables before running this code as follows,

* Download should be set to FALSE if the data set is already residing in a subdirectory of the working directory. If set to TRUE the code will download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip_file should be set to FALSE if the data is already extracted from the zip file

i.e. if the raw data is already extracted in a subdirectory called "./data/UCI HAR Dataset" of the working directory, variables "Download" and "Unzip_file" should both be set to FALSE.

The transformations performed by the script is described in CodeBook.md

## CodeBook.md

CodeBook gives the following details,

* The Course project instructions 
* The study design - how the Human Activity Recognition database was generated
* Raw Data Feature Information
* The step by step procedure used to tidy the data
* Tidy Data Feature Information
