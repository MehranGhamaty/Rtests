
#install.packages('ggplot2', dep = TRUE)
#install.packages('MASS', dep = TRUE)
#install.packages('HSAUR', dep = TRUE)
#install.packages('e1071', dep = TRUE)

library(datasets)


setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if(!exists("recursivekmeans", mode="function")) source("mykmeans.R")
if(!exists("initcentroids", mode="function")) source("initialization.R")

centers <- initCentroids(k_max=2, data=iris[,2:3])


ptm <- proc.time()
recursiveCluster <- recursivekmeans(iris[,2:3], centers, k=2)
#recursivecluster
proc.time() - ptm

ptm <- proc.time()
repeatCluster <- repeatkmeans(iris[,2:3], centers, k=2)
#repeatcluster
proc.time() - ptm

ptm <- proc.time()
irisCluster <- kmeans(iris[,2:3], centers)
#irisCluster$centers
proc.time() - ptm

#iris$Species

#plot clusters
plot(iris[,2:3], col = irisCluster$cluster)
#plot with correct labels
plot(iris[,2:3], col = iris$Species )



