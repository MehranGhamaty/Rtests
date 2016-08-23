install.packages("rstudioapi")
library(datasets)

#do this to set wd to current one
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if(!exists("computeclosest", mode="function")) source("computeclosest.R", chdir= T)
if(!exists("computecentroids", mode="function")) source("computecentroids.R", chdir= T)

X = iris[2:3]
centers = matrix(c(3, 3.5, 5, 1.5), nrow=2, ncol=2, byrow=FALSE)
Y = computeclosest(X,centers,liveplot=T, saveanimation=T)
centers = computecentroids(X,Y,k=2,liveplot=F, saveanimation=F)
