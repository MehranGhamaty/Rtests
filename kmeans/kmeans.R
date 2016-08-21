

if(!exists("computeclosest", mode="function")) source("computeclosest.R")
if(!exists("computecenters", mode="function")) source("computecenters.R")

mykmeans <- function(data, centers, k)
{
  Y <- computeclosest(data, centers)
  
  newcentroids <- computecenters(data,Y,k=5)
  
  if(newcentroids == centers)
  {
    return(newcentroids)
  } else {
    return(mykmeans(data, newcentroids)) 
  }
}


