#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 1: Introduction
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)
#' example of a point pattern
plot(bei)
#' [Discuss purposes of analysis]
#' what is 'bei'
bei
class(bei)
#' bei is an object of class 'ppp' (planar point pattern)
plot(bei)
#' plot is a 'generic' R function which does something sensible for any data.
#' For an object X of class 'ppp',
#' the command plot(X) is 'dispatched' as plot.ppp(X)
help(plot.ppp)
plot(bei, cols="blue")
plot(bei, chars=".")
#' web style help display - recommended
help.start()
help(plot.ppp)
#' Read The Help Files!
help(bei)
#' interactive plot
iplot(bei)

#' Make your own point pattern
X <- clickppp()
plot(X)
#' Read data from file
xy <- read.table("Data/phones.txt", header=TRUE)
names(xy)
str(xy)
Phones <- ppp(xy$x, xy$y, c(0, 20), c(0, 10))
Phones
plot(Phones)

#' basic analysis
summary(bei)
#' dispatched to summary.ppp
intensity(bei)
#' [Discuss concept of intensity; dimensions]



