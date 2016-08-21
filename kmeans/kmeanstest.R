
#install.packages('ggplot2', dep = TRUE)
#install.packages('MASS', dep = TRUE)
#install.packages('HSAUR', dep = TRUE)
#install.packages('e1071', dep = TRUE)

library(datasets)


if(!exists("mykmeans", mode="function")) source("kmeans.R")
if(!exists("initcentroids", mode="function")) source("initialization.R")

centers <- initCentroids(k_max=3, data=iris[,2:3])
myCluster <- mykmeans(iris[,2:3], centers)
myCluster

irisCluster <- kmeans(iris[,2:3], centers)
irisCluster$cluster


iris$Species

#plot clusters
plot(iris[,2:3], col = irisCluster$cluster)
#plot with correct labels
plot(iris[,2:3], col = iris$Species )



