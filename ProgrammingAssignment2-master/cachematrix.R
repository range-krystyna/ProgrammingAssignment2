## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {


## Create a special matrix that can cahe inverse.
## return a list to get and set both the matrix and inverse.
inv = NULL
set = function(y) {
  ## set new functions for current environment
  x<<- y
  inv<<- NULL
  }
get = function() x
setinv = function(inverse) inv <<- inverse 
getinv = function() inv
list(set=set, get=get, setinv=setinv, getinv=getinv)
}
  

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv = x$getinv()
  
    if (!is.null(inv)){
    # get it from the cache and skips the computation. 
    message("getting cached data")
    return(inv)
  }
  
  # calculate the inverse 
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  # sets inverse values in cache.
  x$setinv(inv)
  
  return(inv)
}

