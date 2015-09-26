## Put comments here that give an overall description of what your
## functions do

## Create function the generates a list of 4 functions--
## one returns the value of a matrix
## one that sets the value of a matrix
## one the sets the value of the inverted matrix
## one that returns the value of the inverted matrix, if already calculated

## create function with matrix input

makeCacheMatrix <- function(x = matrix()) {
	inv<-NULL 	##initialize 'inv' to be NULL
	
	setmatrix<-function(a) {
			x<<-a		##set value of x in makeCacheMatrix = a
			inv<<-NULL 	##re-initialize inv to NULL since the matrix has
					##changed
	}
	getmatrix<- function () x	##returns value of matrix
	setinvmatrix<-function(inverse) inv<<-inverse	##changes the valuse of
									##inv in makeCacheMatrix
	getinvmatrix<-function() inv	##returns inverse

	##creates and returns a list of the above functions
	list( setmatrix=setmatrix, getmatrix=getmatrix,
		 setinvmatrix=setinvmatrix, getinvmatrix=getinvmatrix)

}


## function looks for a cached value of the inverse matrix and solves/stores
## it when the invese is not found

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		inv<-x$getinvmatrix()	## calls the getinvmatrix function from
						## makeCacheMatrix to return inv

		if(!is.null(inv)) {
		## if inv is not null, return a message and the cached inverse
			message("getting cached inverse")
			return(inv)
}
		## Otherwise...
		matrix<-x$getmatrix() 	## load the value of matrix into variable
		inv <- solve(matrix, ...) 	##solve the inverse
		x$setinvmatrix(inv)	##sets the cached inv = solved vaule
		inv	##return solved value
	

}
