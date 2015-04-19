#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 9: cluster and Cox processes
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

set.seed(10)
plot(X <- rMatClust(kappa=4, scale=0.1, mu=10))
plot(attr(X, "parents"), add=TRUE, col="green",pch=16)

plot(rMatClust(4, 0.1, 10, nsim=20))

kppm(X ~ 1, "MatClust")

Z <- rMatClust(30, 0.05, 4)
plot(Z)
kppm(Z ~ 1, "MatClust")

set.seed(1919)
Y <- rThomas(50, 0.03, 10)
plot(Y)
kppm(Y ~ 1, "Thomas")

set.seed(1985)
U <- rnoise(runif, max=200)
V <- Smooth(U, sigma=0.05, normalise=TRUE)
V <- 100 + 7 * (V-100)
plot(V)
plot(rpoispp(V), add=TRUE, pch=16)

X <- rLGCP("exp", 4, var=1.5, scale=0.03)
plot(X)
plot(Kest(X))
plot(Lam <- attr(X, "Lambda"))
plot(log(Lam))
hist(log(Lam))

kppm(X ~ 1, "LGCP", model="exp", statistic="pcf")



