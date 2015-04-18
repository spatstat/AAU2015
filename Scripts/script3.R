#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 3: Intensity dependent on a covariate
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#'
library(spatstat)

chorley.extra$plotit()
#' [Discuss problem]

X <- murchison$gold
L <- murchison$faults
plot(X, main="Murchison gold data", chars=16, cex=0.6, cols="blue")
plot(L, add=TRUE, col="red")
#' [Discuss problem]

D <- distmap(L)
plot(D)
plot(L, add=TRUE, col="white")
#' distance to nearest fault

rh <- rhohat(X, D)
plot(rh)
#' [Explain theory]
rh
plot(predict(rh))

copP <- rotate(copper$SouthPoints, pi/2)
copL <- rotate(copper$SouthLines, pi/2)
plot(copP, main="Queensland copper data")
plot(copL, add=TRUE)

copD <- distmap(copL)
plot(rhohat(copP, copD))

berman.test(copP, copD)
bt <- .Last.value
plot(bt)
#' [Explain theory]

bt2 <- berman.test(copP, copD, which="Z2")
plot(bt2)
#' [Explain theory]

plot(roc(copP, copD))
plot(roc(X, D, high=FALSE))
#' ROC plot [development version of spatstat]

