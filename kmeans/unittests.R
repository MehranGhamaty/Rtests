

library(datasets)

if(!exists("computeclosest", mode="function")) source("computeclosest.R")
if(!exists("computecenters", mode="function")) source("computecenters.R")


X = iris[2:3]

# make a matrix of test points 
centers = matrix(c(3, 3.5, 5, 1.5), nrow=2, ncol=2, byrow=FALSE)
Y = computeclosest(X,centers,livePlot=TRUE)
centers = computecenters(X,Y,k=2,livePlot=TRUE)
