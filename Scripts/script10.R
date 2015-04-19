#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 10: Gibbs processes
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

set.seed(42)
XX <- rpoispp(10, nsim=20) 
plot(XX)
sapply(XX, minnndist) > 0.1

plot(rHardcore(beta=10, R=0.1, nsim=20))

plot(rHardcore(beta=50, R=0.1, nsim=20))

plot(cells)
ppm(cells ~ 1, Hardcore())

plot(rStrauss(beta=50, gamma=0.5, R=0.1, nsim=20))
plot(rStrauss(beta=50, gamma=0.9, R=0.1, nsim=20))
plot(rStrauss(beta=50, gamma=0.2, R=0.1, nsim=20))

ppm(cells ~ 1, Strauss(0.1))

plot(swedishpines)
plot(density(swedishpines))
fitP <- ppm(swedishpines ~ polynom(x, y, 2))
plot(Kinhom(swedishpines, sigma=bw.scott))
fitS <- ppm(swedishpines ~ polynom(x,y,2), Strauss(9))
anova(fitP, fitS, test="LR")

plot(predict(fitS, type="cif"))
plot(swedishpines, add=TRUE, cols="white", pch=16)

plot(intensity(fitS))
plot(simulate(fitS, nsim=10))

step(fitS)

plot(leverage(fitS))
plot(influence(fitS))

