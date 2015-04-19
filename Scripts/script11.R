#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 11: Multitype summary functions and models
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

plot(amacrine)
plot(Y <- split(amacrine))
plot(Kest(Y$on))
plot(Kest(Y$off))

plot(Kcross(amacrine, "on", "off"))

plot(alltypes(amacrine, Kcross))
plot(alltypes(amacrine, Lcross))

#' random shifts - for testing independence between components
plot(rshift(amacrine, radius=0.1, edge="torus"), cols=2:3)
#' repeat

#'   envelope() argument 'simulate'
simex <- expression(rshift(amacrine, radius=0.2, edge="torus"))
eval(simex)
eval(simex)
plot(envelope(amacrine, Kcross, nsim=39, simulate=simex))

#' 
mad.test(amacrine, Kcross, nsim=39, simulate=simex)
#' distance interval not too important for MAD test
dclf.test(amacrine, Kcross, nsim=39, simulate=simex, ginterval=c(0,0.1))
#' distance interval quite important for DCLF test

#' random labelling
plot(chorley,
     chars=c(16, 3), cex=c(1, 0.4), cols=2:3)
plot(rlabel(chorley), 
     chars=c(16, 3), cex=c(1, 0.4), cols=2:3)
#' [repeat]

#' [Hand made Monte Carlo test]
chorley.extra$incin
d2incin <- function(x,y) { (x-354.5)^2+(y-413.6)^2 }
sumd <- function(X) {
  Y <- split(X)$larynx
  sum(1/d2incin(Y$x, Y$y))
}
(obsval <- sumd(chorley))
simpats <- replicate(99, rlabel(chorley), simplify=FALSE)
simvals <- sapply(simpats, sumd)
mean(c(simvals, obsval) >= obsval)

#' Multitype point process models
R <- matrix(0.05, 2, 2)
fit <- ppm(amacrine ~ 1, MultiStrauss(radii=R))
fit
R1 <- diag(c(0.05, 0.05))
R1
fit1 <- ppm(amacrine ~ 1, MultiStrauss(radii=R1))
fit1

plot(simulate(fit1))

fitp <- profilepl(data.frame(R=seq(0.05, 0.15, by=0.005)),
                  function(R) MultiStrauss(radii=diag(c(R,R))),
                  amacrine~1)
fitp
plot(fitp)
fitopt <- as.ppm(fitp)

plot(simulate(fitopt))


