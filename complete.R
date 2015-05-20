###Task 2###
#complete <- function(directory, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases}

#Part 2: Write function complete
dir<-"C:/Users/User/Desktop/R Programming/rprog-data-specdata"
setwd(dir)

complete <- function(directory, id = 1:332) {
  dir <- paste(getwd(),directory, sep='/')
  
  all_files <- list.files(dir)
  file_paths <- paste(dir, all_files, sep='/')
  
  comp_cases <- rep(0,length(id))
  j <- 1 #initialising j out of loop
  for (i in id){
    current_file <- read.csv(file_paths[i], header=TRUE, sep=',', na.strings="NA")
    comp_cases[j] <- sum(complete.cases(current_file))
    j <- j+1
  }
  result <- data.frame(id=id, nobs=comp_cases)
  return(result)
}

#Tests
#complete("specdata", 1)
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)

#Submission
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
setwd("C:/Users/User/Desktop/R Programming/Prog Assignment 1")
submit()
