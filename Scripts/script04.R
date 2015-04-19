#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 4: Fitting Poisson models
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

plot(rpoispp(100))
plot(rpoispp(30, nsim=20), main.panel="", mar.panel=1, pch=16)
#' [Point process - 'ensemble']
#' [Poisson properties]

#' [Homogeneous Poisson process is completely specified by its intensity]
intensity(swedishpines)
#' Fit model to data
ppm(swedishpines)
#' No other arguments - assume homogeneous Poisson.
m <- ppm(swedishpines)
class(m)
coef(m)
simulate(m)
#'
lam <- function(x,y) { 400 * exp(-2*(x + y)) }
plot(Y <- rpoispp(lam))
plot(rpoispp(lam, nsim=20), main.panel="", mar.panel=1, pch=16)
#' [Inhomogeneous Poisson process is completely specified by
#' its intensity function.]

#' Fit model. 
ppm(Y ~ x + y)
#' Formula specifies form of **log** intensity
#' [Write out formula before/after fit]
mxy <- ppm(Y ~ x + y)
coef(mxy)

X <- murchison$gold
L <- murchison$faults
X <- rescale(X, 1000, unitname="km")
L <- rescale(L, 1000, unitname="km")
plot(X, main="Murchison gold data", chars=16, cex=0.6, cols="blue")
plot(L, add=TRUE, col="red")
D <- distfun(L)

fitD <- ppm(X ~ D)
fitD
coef(fitD)
#' Fitted coefficients [write formula]
plot(effectfun(fitD, "D"))
confint(fitD)
vcov(fitD)
plot(predict(fitD))
plot(simulate(fitD))

#' test for significance of effect
fit0 <- ppm(X ~ 1)
fit0
anova(fit0, fitD, test="LR")

#'
copP <- rotate(copper$SouthPoints, pi/2)
copL <- rotate(copper$SouthLines, pi/2)
plot(copP, main="Queensland copper data")
plot(copL, add=TRUE)
#'
copD <- distmap(copL)
cfD <- ppm(copP ~ copD)
cf0 <- ppm(copP ~ 1)
anova(cf0, cfD, test="LR")

#' model selection
cfD3 <- ppm(copP ~ polynom(copD, 3))
cfD3
step(cfD3)

