# Authour: Gurpal Bisra
# Language: R
# Date: May 13, 2016
# Code: complete.R

setwd("////Mac/Home/Desktop/Data_Science/R/A1/rprog_data_specdata")
getwd()
list.files()

complete <- function(directory, id = 1:332) {
  # 'directory' = character vector of length 1 indicating the location of the CSV files.
  # 'id' = integer vector indicating the monitor ID numbers to be used.
  
  # Return a data frame of the form:
  # id nobs
  # 1  117
  # 2  1041
  # ...
  # where 'id' is the monitor ID number and 'nobs' is the number of complete cases.
  
  # Set Working Directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # Get id vector length
  id_len <- length(id)
  complete_data <- rep(0, id_len)
  
  # Locate all files in specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  j <- 1 
  for (i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  result <- data.frame(id = id, nobs = complete_data)
  return(result)
} 