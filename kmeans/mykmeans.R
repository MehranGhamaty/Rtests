

if(!exists("computeclosest", mode="function")) source("computeclosest.R")
if(!exists("computecenters", mode="function")) source("computecenters.R")

# isn't it beautiful?
# Recusive implementation of Lloyd's algorithm 
mykmeans <- function(data, centers, k)
{
  # Assignment Step
  Y <- computeclosest(data, centers)
  # Update Step
  newcentroids <- computecenters(data,Y,k=5)
  # If they centroids match we return them otherwise try again with the new set of centroids\
  if(newcentroids == centers)
  {
    return(newcentroids)
  } else {
    return(mykmeans(data, newcentroids)) 
  }
}


