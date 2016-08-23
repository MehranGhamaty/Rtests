centerColors = c('blue','red')
 
#euc distance (no sqrt because our equation squares the distance)
euc.dist <- function(x1, x2) sum((x1 - x2) ^ 2)

#takes a set of Xs and centers and returns the center which each point is closest to
#centers returned are from the index locations
computeclosest <- function(X, centers,liveplot=FALSE,saveanimation=FALSE)
{
  #get distance from each point to each center
  Y <- NULL
  for(i in 1:nrow(X))
  {
    if(liveplot)
    {
      #plot all the points that have not currently been inspected
      plot(x= X[,1], y= X[,2])
      #plot previous points with their classication color
      points(x= X[0:length(Y),1], y= X[0:length(Y),2], col=centerColors[Y],pch=16)
    }
    
    #get the distance from each row 
    dist <- NULL
    for(c in 1:nrow(centers))
    {
      if(liveplot)
      {
        segments(x0=X[i,1],y0=X[i,2],x1=centers[c,1],y1=centers[c,2], col='green')
      }
      dist[c] <- euc.dist(centers[c,],X[i,])
    }
    closestCenter = which.min(dist)
    
    if(liveplot)
    {
      #centers
      points(x=centers[,1], y=centers[,2], col=centerColors, pch=6, cex=3)
      #target point color same as the closest center
      points(x=X[i,1], y=X[i,2], col=centerColors[closestCenter], pch=20, cex=2)
      Sys.sleep(0.1)
    }
    
    Y[i] <- closestCenter
  }
  return(Y)
}
