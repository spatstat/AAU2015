#'      Workshop on analysing spatial point patterns with spatstat
#'                   Aalborg, April 2015
#' 
#'                   Lecturer's R script 
#'                  Session 7: Envelopes and Monte Carlo tests
#' 
#'         Copyright (c) Adrian Baddeley and Ege Rubak 2015
#' 
library(spatstat)

set.seed(42)
inde <- rpoispp(100)
regu <- rSSI(0.09, 70)
clus <- rMatClust(30, 0.05, 4)

plot(Kest(clus), cbind(iso,theo) ~ r, lwd=2)
plot(Kest(rpoispp(ex=clus)), iso ~ r, add=TRUE)
for(i in 1:10) plot(Kest(rpoispp(ex=clus)), iso ~ r, add=TRUE)

plot(envelope(clus, Kest, nsim=19))

pats <- rpoispp(ex=clus, nsim=19)
pats[[20]] <- clus
plot(pats, main.panel="", pch=3)

clarkevans(clus)
clarkevans(clus, correction="D")
ce <- sapply(pats, clarkevans, correction="D")
mean(ce[20] >= ce)

plot(envelope(clus, Kest, nsim=19))

plot(envelope(clus, Lest, nsim=19))

plot(envelope(clus, Lest, nsim=19, global=TRUE))

mad.test(clus, Lest, nsim=19)

dclf.test(clus, Lest, nsim=19)

