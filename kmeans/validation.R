
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