

# http://www.cs.kent.edu/~jin/DM08/ClusterValidation.pdf

# using similarity matrix for clustring validation
# http://stackoverflow.com/questions/5639794/in-r-how-can-i-plot-a-similarity-matrix-like-a-block-graph-after-clustering-d



#https://cran.r-project.org/web/packages/e1071/e1071.pdf
#matchclasses

testkmeans <- function(X, Y, centers)
{
  for(i in 1:nrow(X))
  {
    for(i in 1:nrow(centers))
    {
      dist <- NULL
      for(i in 1:nrow(X)) dist[i] <- euc.dist(centers[1,],X[i,])
      winner <- which.min(dist)
    }
  }
}

crossvalidation <- function(testX, testY, trainX, trainY, classalgorithm)
{
  clusters <- classalgorithm(trainX,trainY)
  
  
}
