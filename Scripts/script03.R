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

murX <- murchison$gold
murL <- murchison$faults
plot(murX, main="Murchison gold data", chars=16, cex=0.6, cols="blue")
plot(murL, add=TRUE, col="red")
#' [Discuss problem]

copP <- rotate(copper$SouthPoints, pi/2)
copL <- rotate(copper$SouthLines, pi/2)
plot(copP, main="Queensland copper data")
plot(copL, add=TRUE)

copD <- distmap(copL)
plot(copD)
plot(copL, add=TRUE, col="white")
#' distance to nearest fault

#' [divide range of covariate into bands]
facD <- cut(copD, breaks=5)
tesD <- tess(image=facD)
copQ <- quadratcount(copP, tess=tesD)
copQ
intensity(copQ)

#' 
rh <- rhohat(copP, copD)
plot(rh)
#' [Explain theory]
rh
plot(predict(rh))

#' gold data
murD <- distmap(murL)
plot(murD)
plot(murL, add=TRUE, col="white")

plot(rhohat(murX, murD))

berman.test(copP, copD)
bt <- .Last.value
plot(bt)
#' [Explain theory]

bt2 <- berman.test(copP, copD, which="Z2")
plot(bt2)
#' [Explain theory]

plot(roc(copP, copD))
plot(roc(murX, murD, high=FALSE))
#' ROC plot [development version of spatstat]

