

## CREATE DATA ##
## assume viral load is distributed exponentially
## control:
## - 100 indiv with rate=0.002
## - 20 indiv with rate=0.001 (outliers)
## treatment:
## - 55 indiv with rate=0.004
## - 15 indiv with rate=0.001 (outliers)

set.seed(1)
titer <- c(rexp(100, rate=0.002), rexp(20, rate=0.0005), # control
        rexp(55, rate=0.006), rexp(15, rate=0.0005)) # treatment

type <- factor(rep(c("control","treatment"), c(120,70)))


## make a data frame
VL <- data.frame(titer=titer, type=type)
save(VL, file="VL.RData")

## t-test
t.test(titer~type)


## PLOT DATA ##
library(ggplot2)

## histograms
ggplot(VL, aes(x=titer)) + geom_histogram(aes(fill=type))

## density
ggplot(VL, aes(x=titer)) + geom_density(aes(fill=type), alpha=.5)

## density, smoother
ggplot(VL, aes(x=titer)) + geom_density(aes(fill=type), alpha=.5, adjust=4)

