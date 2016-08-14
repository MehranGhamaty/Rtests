#install.packages('ggplot2', dep = TRUE)
#install.packages('MASS', dep = TRUE)
#install.packages('HSAUR', dep = TRUE)
library(datasets)
library(cluster)
library(ggplot2)
library(HSAUR)

#euc distance (no sqrt because our equation squares the distance)
euc.dist <- function(x1, x2) sum((x1 - x2) ^ 2)

initCentroids <- function(k_max, data)
{
  k = 1
  
  #initialize the matrix number of rows is going to be the number of centroids
  # number of columns is the dimensionality of the dataset
  centers <- matrix(0,nrow=k_max,ncol=ncol(data))
  row_to_take <- sample(1:nrow(data), 1, replace=F)
  while(k <= k_max)
  {
    #Choose one center uniformly at random from among the data points.
    centers[k,] <- data[row_to_take , 1:ncol(data)]
    #remove this row from the dataset so we do not pick it again
    data <- data[-c(row_to_take),]
    
    #this will convert the list back into matrixes
    centers <- matrix(unlist(centers), ncol = ncol(data), byrow = F)
    
    #For each data point x, compute D(x), the distance between x and the nearest center that has already been chosen.
    dist <- NULL
    for(i in 1:nrow(data)) dist[i] <- euc.dist(centers[1,],data[i,])
    #Choose one new data point at random as a new center, using a weighted probability distribution where a point x 
    # is chosen with probability proportional to D(x)2. probabilities are D(x)^2/sum of D(x)^2
    dist <- dist/Reduce("+",dist)
    row_to_take=sample(c(1:length(dist)), 1, replace = F, prob = dist)
    #Repeat Steps 2 and 3 until k centers have been chosen.
    k=k+1
  }
  return(centers)
}


centers <- initCentroids(k_max=3, data=iris[,2:3])

irisCluster <- kmeans(iris[,2:3], centers)
plot(iris[,2:3], col = irisCluster$cluster)
plot(iris[,2:3], col = iris$Species )
