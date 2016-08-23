
#install.packages('e1071', dep = TRUE)
#install.packages("rstudioapi")
library(datasets)

#do this to set wd to current one
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

if(!exists("mykmeans", mode="function")) source("mykmeans.R")
if(!exists("initcentroids", mode="function")) source("initialization.R")

centers <- initcentroids(k_max=3, data=iris[,2:3])
myCluster <- mykmeans(iris[,2:3], centers)
myCluster

#irisCluster <- kmeans(iris[,2:3], centers)
#irisCluster$cluster

#iris$Species
#plot clusters
#plot(iris[,2:3], col = irisCluster$cluster)
#plot with correct labels
plot(iris[,2:3], col = iris$Species )



