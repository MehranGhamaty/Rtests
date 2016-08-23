centerColors = c('blue','red')
folder = "animation/computecentroids/"
name = "computecentroids"
extension = ".png"

getnumber = function(i,decimalplaces=3)
{
  toreturn = toString(i)
  while(nchar(toreturn) < decimalplaces)
  {
    toreturn = paste("0",toreturn, sep="")
  }
  return(toreturn)
}

#takes a set of Xs and centers and returns the center which each point is closest to
#centers returned are from the index locations
computecentroids <- function(X, Y, k=NULL,liveplot=FALSE,saveanimation=FALSE)
{
  newcentroids = matrix(0, nrow=k, ncol=ncol(X))
  pointscount = c(0,0,0)
  
  for(i in 1:nrow(X))
  {

    newcentroids[Y[i],] = newcentroids[Y[i],] + X[i,]
    newcentroids <- matrix(unlist(newcentroids), ncol = ncol(X), byrow = F)
    pointscount[Y[i]] = pointscount[Y[i]] + 1
    
    
    if(liveplot)
    {
      if(saveanimation) png(filename=paste(folder,name,getnumber(i),extension,sep=""))
      plot(x = X[,1], y = X[,2], col=centerColors[Y], pch=1)
      points(x = X[0:i,1], y = X[0:i,2], col=centerColors[Y],pch=16)
      points(x = newcentroids[,1]/pointscount, y= newcentroids[,2]/pointscount, col=centerColors, pch=6, cex=4) #update where centers are
      if(saveanimation) dev.off()
      Sys.sleep(0.1)
    }
  }

  for(c in 1:nrow(newcentroids))
  {
    newcentroids[c,] <- newcentroids[c,] / pointscount[c]
    newcentroids <- matrix(unlist(newcentroids), ncol = ncol(X), byrow = F)
  }

  return(newcentroids)
}
