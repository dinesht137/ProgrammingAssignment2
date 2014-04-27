##The functions below "makeCacheMatrix" & "cacheSolve" are used to calculate the inverse of an input square matrix.
 In this case,when a square matrix is given as an input to "cacheSolve" function, it will first look for the inverse of that matrix in "makeCacheMatrix"
 to check whether the inverse is already computed. If it is already computed,the function "cachesolve" vl recall d value directly from "makeCacheMatrix" 
 function and avoids computing again. If the value is not computed before,then the inverse vl b calculated in "cacheSolve" function itself using "solve"
 function in R and returns the inverse of the input matrix . 


## "makeCacheMatrix" is a function, which has matrix "x" as an argument and returns a list of 4 variables "set","get","setInverse","getInverse".

makeCacheMatrix <- function(x = matrix()) {m<-NULL
 set<-function(y){
     x<<-y
     m<<-NULL}
 get<-function()x
 setInverse<-function(solve)
 m<<-solve
 getInverse<-function()m
 list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)

}


## This function takes the input argument matrix and vl recall d inverse from the above function.If the inverse is not computed before,it vl compute n returns d result.
cacheSolve <- function(x, ...) { m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m

        ## Return a matrix that is the inverse of 'x'
}
