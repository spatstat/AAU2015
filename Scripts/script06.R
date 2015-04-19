#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 6: Correlation
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

set.seed(42)
inde <- rpoispp(100)
regu <- rSSI(0.09, 70)
clus <- rMatClust(30, 0.05, 4)

plot(regu)
plot(inde)
plot(clus)

fryplot(regu)
fryplot(regu, width=0.5)

#' [resize window to 3 x 2]
par0 <- par(mfrow=c(2,3), mar=rep(1,4))
plot(regu)
plot(inde)
plot(clus)
fryplot(regu, width=0.5)
fryplot(inde, width=0.5)
fryplot(clus, width=0.5)
par23 <- par(par0)

plot(Kest(regu))
Kest(regu)

par(mfrow=c(2,3), mar=0.3+c(4,4,1,1))
plot(regu)
plot(inde)
plot(clus)
plot(Kest(regu))
plot(Kest(inde))
plot(Kest(clus))
par23x <- par(par0)

K <- Kest(regu)
plot(K, . ~ r)
plot(K, iso ~ r)
plot(K, . - theo ~ r)
plot(K, sqrt(./pi) ~ r)

plot(Lest(regu))

par(par23x)
plot(regu)
plot(inde)
plot(clus)
plot(Lest(regu))
plot(Lest(inde))
plot(Lest(clus))
par(par0)

plot(pcf(regu))
plot(pcf(clus))
plot(pcf(clus, divisor="d"))

par(par23x)
plot(regu)
plot(inde)
plot(clus)
plot(pcf(regu))
plot(pcf(inde))
plot(pcf(clus))
par(par0)

#' inhomogeneous?
par(mar=0.5+c(4,4,2,1))
X <- rpoispp(function(x,y){ 1000 * exp(- 10 * ((x-0.5)^2+(y-0.5)^2)) })
par(mfrow=c(1,2))
plot(X)
plot(Kest(X))
#' [Kest is 'fooled']
par(mfrow=c(1,3))
plot(X)
plot(density(X, sigma=bw.scott))
plot(Kinhom(X, sigma=bw.scott))
#' sensitive to estimation of lambda





