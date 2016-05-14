# Authour: Gurpal Bisra
# Language: R
# Date: May 13, 2016
# Code: pollutantmean.R

setwd("////Mac/Home/Desktop/Data_Science/R/A1/rprog_data_specdata")
getwd()
list.files()

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  # 'directory' = character vector of length 1 indicating the location of the CSV files
  # 'pollutant' = character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; either "sulfate" or "nitrate".
  # 'id' = integer vector indicating the monitor ID numbers to be used
  
  # Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  
  # Set Working Directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # Initialize vector to hold pollutant data
  mean_vector <- c()
  
  # Locate all files in specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  result <- mean(mean_vector)
  return(round(result, 3)) 
}

# R Programming Quiz Questions:
pollutantmean("specdata", "sulfate", 1:10)
# 4.064
pollutantmean("specdata", "nitrate", 70:72)
# 1.706
pollutantmean("specdata", "nitrate", 34)
# 1.477
pollutantmean("specdata", "nitrate")
# 1.703