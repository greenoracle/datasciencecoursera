# Authour: Gurpal Bisra
# Language: R
# Date: May 13, 2016
# Code: complete.R

setwd("////Mac/Home/Desktop/Data_Science/R/A1/rprog_data_specdata")
getwd()
list.files()

corr <- function(directory, threshold = 0) {
  # 'directory' = character vector of length 1 indicating the location of the CSV files.
  # 'threshold' = numeric vector of length 1 indicating the number of completely observed observations (on all
  # variables) required to compute the correlation between nitrate and sulfate; the default is 0.
  # Return a numeric vector of correlations.
  
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # Obtain compmlete table
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  
  # Locate valid ids
  ids <- complete_table$id[nobs > threshold]
  
  # Obtain ids vector length
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  
  # Locate all files in specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  j <- 1
  for(i in ids) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)   
}