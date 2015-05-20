###Task 3###
#corr <- function(directory, threshold = 0) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!}

#Remember to load complete function first
#Part 3: Write function corr
dir<-"C:/Users/User/Desktop/R Programming/rprog-data-specdata"
setwd(dir)

corr <- function(directory, threshold = 0){
  dir <- paste(getwd(),directory, sep='/')
  
  all_files <- list.files(dir)
  file_paths <- paste(dir, all_files, sep='/')
  
  #Get table of completed ids and their nobs
  complete_table <- complete("specdata",1:332)
  nobs <- complete_table$nobs
  
  #Find ids for which nobs is valid
  ids <- complete_table$id[nobs > threshold]
  
  #Vector to store correlations
  corrs <- rep(0, length(ids))
  
  j<-1
  for (i in ids){
    current_file <- read.csv(file_paths[i], header=TRUE, sep=',', na.strings="NA")
    corrs[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j+1
  }
  result <- corrs
  return(result)
}

#Tests
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)

#Submission
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
setwd("C:/Users/User/Desktop/R Programming/Prog Assignment 1")
submit()