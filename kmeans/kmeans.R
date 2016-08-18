


mykmeans <- function(data, centers)
{
  closestcenter <- computeclosest(data, centers)
  
  #average each class to create new centers
  centerpoints <- NULL
  
  newcentroids <- matrix(0, nrow=nrow(centers), ncol=ncol(centers))
  for(c in 1:nrow(centers))
  {
    newcentroid <- rep(0, times = ncol(centers))
    pointscount <- 0
    for(i in 1:nrow(data))
    {
      #it is part of the average we are calculating
      if(closestcenter[i] == c){
        newcentroid <- newcentroid + data[i,]
        pointscount <- pointscount + 1
      }
    }
    newcentroids[c,] <- newcentroid / pointscount
    newcentroids <- matrix(unlist(newcentroids), ncol = ncol(centers), byrow = F)
  }
  print(newcentroids)
  
  if(newcentroids == centers)
  {
    return(newcentroids)
  } else {
    return(mykmeans(data, newcentroids)) 
  }
}


