### Task 1 ###
#pollutantmean <- function(directory, pollutant, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result! }

#Part 1: Write function pollutantmean
dir<-"C:/Users/User/Desktop/R Programming/rprog-data-specdata"
setwd(dir)

pollutantmean <- function(directory, pollutant, id = 1:332){
  #Set Working Directory and find files in specdata foldersubmit()
  dir <- paste(getwd(),directory, sep='/')
  all_files <- list.files(dir)
  file_paths <- paste(dir, all_files, sep='/')
  
  #Initialise vector to hold means
  means <- c()
  for (i in id) {
    current_file <- read.csv(file_paths[i], header=TRUE, sep=',', na.strings="NA")
    na_rem <- current_file[!is.na(current_file[pollutant]), pollutant]
    means <- c(means,na_rem)
  }
  result <- mean(means)
  return(result)
  #return(round(result,3))
}

#Tests
pollutantmean("specdata", "sulfate", 1:10) #4.064
pollutantmean("specdata", "nitrate", 70:72) #1.706
pollutantmean("specdata", "nitrate", 23) #1.281

#Submission
#source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
#setwd("C:/Users/User/Desktop/R Programming/Prog Assignment 1")
#submit()
