## Matrix inversion is usually a costly computation and 
## there may be some benefit to 
## caching the inverse of a matrix rather than compute it repeatedly

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        xxx <- NULL
        YYY <- function(y){
                x <<- y
                xxx <<- NULL
        }
        zzz <- function() x
        setInverse <- function(inverse) xxx <<- inverse
        getInverse <- function() xxx
        list(yyy = yyy,
             zzz = zzz,
             setInverse = setInverse,
             getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                xxx <- x$getInverse()
                if (!is.null(xxx)) {
                        message("retrieve cache data")
                        return(xxx)
                }
                iii <- x$zzz()
                xxx <- solve(iii, ...)
                x$setInverse(xxx)
                xxx
}
