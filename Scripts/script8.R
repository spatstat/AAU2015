#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 8: Spacing and nearest neighbours
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

plot(cells, type="n")
text(cells, labels=1:npoints(cells))
nnwhich(cells)

plot(cells)
nn <- nnwhich(cells)
arrows(cells$x, cells$y, cells[nn]$x, cells[nn]$y, length=0.2, angle=20)

nndist(cells)

stienen(cells)

plot(Gest(cells))

set.seed(42)
inde <- rpoispp(100)
regu <- rSSI(0.09, 70)
clus <- rMatClust(30, 0.05, 4)

par0 <- par(mfrow=c(2,3), mar=0.3+c(4,4,1,1))
plot(regu)
plot(inde)
plot(clus)
plot(Gest(regu))
plot(Gest(inde))
plot(Gest(clus))

plot(regu)
plot(inde)
plot(clus)
plot(envelope(regu, Gest, nsim=19))
plot(envelope(inde, Gest, nsim=19))
plot(envelope(clus, Gest, nsim=19))
par23x <- par(par0)

plot(dirichlet(regu))
plot(dirichlet(clus))

plot(distmap(regu))

par(mfrow=c(2,3), mar=0.3+c(0,0,0,2))
plot(regu)
plot(inde)
plot(clus)
plot(distmap(regu))
plot(distmap(inde))
plot(distmap(clus))
par23r <- par(mfrow=c(1,1), mar=rep(0.1, 4))

plist <- solist(regu=regu, inde=inde, clus=clus)
dlist <- lapply(plist, distmap)
pdlist <- as.solist(append(plist, dlist))
plot(pdlist, equal.scales=TRUE, mar.panel=1, main="")


