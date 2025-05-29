## Put comments here that give an overall description of what your
## functions do
The functions will work together to create a special 'object' to store the matrix and cache its inverse.
## Write a short comment describing this function
The function contains a special "matrix" object that cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x<<-y
                inv <<- NULL
}
get <- function () x
setinverse <- function(inverse)inv <<- inverse
getinverse<- function () inv
list(set = set, get = get,
     setinverse=setinverse,
     getinverse=getinverse)

## Write a short comment describing this function
Computate the inverse of the "matrix" returned by makeCache.
cacheSolve <- function(x, ...) {
        inv <-x$getinverse()
        if (!is.null(inv)) {
                message("getting cached inverse")
                return(inv)
}
data <- x$get()
inv <- solve (data, ...)
x$setinverse(inv)
inv
