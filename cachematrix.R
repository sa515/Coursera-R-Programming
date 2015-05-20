## Pair of functions that cache the inverse of a matrix
## No need to check for invertibility since matrix assumed to be invertible

## makeCacheMatrix creates a special "matrix", which is
## really a list containing a function to
## 1. set the value of the matrix (set)
## 2. get the value of the matrix (get)
## 3. set the value of the inverse (setinverse)
## 4. get the value of the inverse (getinverse)

makeCacheMatrix <- function(x = matrix()) {
    cache <- NULL    
    
    set <- function(newval) {
        #assign new value to matrix entered for storage
        x <<- newval
        #flush cache
        cache <<- NULL
    }
    
    #retrieves stored matrix
    get <- function() {
        x
    }
    
    #caches inverse
    setinverse <- function(solve) {
        cache <<- solve
    }
    
    #retrieves cached value
    getinverse <- function () {
        cache
    }
    
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
    
}


## cacheSolve computes inverse of the matrix returned
## by makeCacheMatrix above. If inverse already calculated
## and matrix has not changed, then cacheSolve should retrieve
## inverse from the cache

cacheSolve <- function(x, ...) {
    
    cache <- x$getinverse()
    if(!is.null(cache)){
        message("getting cached data")
        return(cache)
    }
    
    cache <- solve(x$get())
    x$setinverse(cache)
    print(cache)
    
    ## Return a matrix that is the inverse of 'x'
}


#Tests
# 
# a <- makeCacheMatrix(matrix(c(1,2,12,13), nrow = 2, ncol = 2))
# summary(a)
# a$get()
# 
# cacheSolve(a)
# cacheSolve(a)


