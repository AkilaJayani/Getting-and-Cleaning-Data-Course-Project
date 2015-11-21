# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course - Coursera - Project

This repo is concerned with taking the raw  Human Activity Recognition database made available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and converting it to a tidy data set.

This repo contains the following files

* run_analysis.R - R script for performing the analysis
* CodeBook.mb - code book that describes the variables, the data, and transformations that were performed to clean up the data
 
## run_analysis.R
R script that was used to transform the raw data to tidy data is given in this file. User needs to set two variables before running this code as follows,

* Download should be set to FALSE if the data set is already residing in a subdirectory of the working directory. If set to TRUE the code will download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip_file should be set to FALSE if the data is already extracted from the zip file

The transformations performed by the script is described in CodeBook.mb

