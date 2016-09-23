

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if(!exists("computeclosest", mode="function")) source("computeclosest.R")
if(!exists("computecenters", mode="function")) source("computecenters.R")

# isn't it beautiful?
# Recusive implementation of Lloyd's algorithm 
recursivekmeans <- function(data, centers, k)
{
  # Assignment Step
  Y <- computeclosest(data, centers)
  # Update Step
  newcentroids <- computecenters(data, Y, k=k)
  # If they centroids match we return them otherwise try again with the new set of centroids\
  #print(newcentroids)
  #print(centers)
  if(all(newcentroids == centers))
  {
    return(newcentroids)
  } else {
    return(recursivekmeans(data, newcentroids, k=k)) 
  }
}

#Lloyd's Algorithm 
repeatkmeans <- function(data, centers, k)
{
  repeat {
    # Assignment Step
    Y <- computeclosest(data, centers)
    # Update Step
    newcentroids <- computecenters(data, Y, k=k)
    # If they centroids match we return them otherwise try again with the new set of centroids
    if(all(newcentroids == centers))
    {
      break
    } else {
      centers = newcentroids
    }
  }
  return(newcentroids)
}
