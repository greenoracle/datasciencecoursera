# Authour: Gurpal Bisra
# Language: R
# Date: May 14th, 2016
# Code: cachematrix.R
#     Function 1: makeCacheMatrix = creates special "inverse matrix"
#     Function 2: cacheSolve = calculates the inverse of special "inverse matricies"

# Function 1: makeCacheMatrix <- function(x = matrix()) 
#     Purpose: Creates special "matrix" with the following steps:
#         1) Set the value of the matrix
#         2) Get the value of the matrix
#         3) Set the value of the inverse
#         4) Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse matrix value to null
  inv <- NULL
  
  # Step 1) Set the value of the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Step 2) Get the value of the matrix
  get <- function() x
  
  # Step 3) Set the value of the inverse
  set_inverse <- function(inv_input) inv <<- inv_input
  
  # Step 4) Get the value of the inverse
  get_inverse <- function() inv
  
  # Finally, return a list of the above functions
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

# Function 2: cacheSolve <- function(x, ...)
#     Purpose: calculates the inverse of special "matricies" created by makeCacheMatrix function
#         1) Checks to see if the inverse has already been calculated
#         2) If it has, then get the inverse from the cache and not calculate
#         3) Else calculate the inverse matrix
#         4) Set the value of the inverse in cache

cacheSolve <- function(x, ...) {
  # Step 1) Checks to see if the inverse has already been calculated
  # Step 2) If it has, then get the inverse from the cache and not calculate
  inv <- x$get_inverse()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  
  # Step 3) Else calculate the inverse matrix
  data <- x$get()
  
  # Step 4) Set the value of the inverse in cache
  inv <- solve(data, ...)
  x$set_inverse(inv)
  inv
}