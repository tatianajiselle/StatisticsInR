###
#CIS 321, Week 10 
#Maximum Likelihood

#We'll calculate some 
#maximum likelihood estimators

# Let's load a library for MLE
library(stats4)

y <- rexp(20,3)

LL <- function(lambda) -sum(dexp(y, lambda, log = TRUE))

fitexp <- mle(LL, start = list(lambda = 2), nobs = NROW(y),
            
            method = "Brent", lower = 1, upper = 20)



