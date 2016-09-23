
library(Rcpp)

Module(logger_module)

#install.packages("modules")


# For building the skeleton of the project
#Rcpp.package.skeleton("Logger", attributes = TRUE)

# recompile project
# compileAttributes(pkgdir="Logger")

# not sure if necessary
#logger_module <- Module( "logger_module", PACKAGE="Logger" )

# construct a new logger object
log <- new( Logger, "/home/mehran/test.log" )

# log to file
log$log("test")

