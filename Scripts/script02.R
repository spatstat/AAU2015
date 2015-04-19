#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 2: Inhomogeneous Intensity
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)
plot(swedishpines)
plot(bei)
swp <- swedishpines
#' Possible spatial variation in forest density
a <- quadratcount(swp, 3, 3)
a
plot(a)
#' object of a class that can be both printed and plotted.
#'
plot(swp)
plot(a, add=TRUE, col="red")
#'
#'
#' For homogeneous pattern, numbers should be **approximately* equal
#' Apply chi^2 test
quadrat.test(swp, 3, 3)
#' [Interpret]

b4 <- quadrat.test(bei, 4, 2)
b4
plot(bei, chars=".")
plot(b4, add=TRUE, col="blue")
#' test result can also be plotted

plot(q8 <- quadratcount(bei, 8, 4))
plot(q16 <- quadratcount(bei, 16, 8))

plot(intensity(q8, image=TRUE))
plot(intensity(q16, image=TRUE))
#' [concept of intensity function]

plot(density(bei))
Z <- density(bei)
#' density() is generic, with a method density.ppp()
#' [explain kernel smoothing]
Z
class(Z)
#' Pixel image 
plot(Z)
contour(Z)
persp(Z, theta=-30)
persp(Z, theta=-50, phi=20, border=NA, col="yellow", shade=0.7, apron=TRUE)
contour(Z)
#' intensity : points per unit area

plot(density(bei, sigma=100))
plot(density(bei, sigma=10))
#' bandwidth selection
bw.scott(bei)
bw.diggle(bei)
bop <- bw.diggle(bei)
bop
plot(bop)
plot(density(bei, sigma=bw.scott(bei)))
plot(density(bei, sigma=bw.scott))

