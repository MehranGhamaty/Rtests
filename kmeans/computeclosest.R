
#euc distance (no sqrt because our equation squares the distance)
euc.dist <- function(x1, x2) sum((x1 - x2) ^ 2)

computeclosest <- function(X, centers)
{
  #get distance from each point to each center
  Y <- NULL
  for(i in 1:nrow(X))
  {
    #get the distance from each row 
    dist <- NULL
    for(c in 1:nrow(centers)) dist[c] <- euc.dist(centers[c,],data[i,])
    print(dist)
    print(min(dist))
    Y[i] <- which.min(dist)
  }
  return(Y)
}