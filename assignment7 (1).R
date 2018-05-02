##########
#HW 7, CIS321
#Complete the questions below 
#Submit to BB after confirming that this file runs without error.
#Fill in your details below.
#Full Name:Tatiana Ensslin  
#Syr Email Address: tjenssli@syr.edu
#Date: April 8th, 2016
##########

### Problem 0
# Read Chapters 21 & 23 in your text

### Problem 1
# Compute a maximum likelihood estimate of lambda
# using the poisson data stored in y 

y <- c(4, 5, 2, 4, 2, 3, 5, 2, 3, 4, 0, 1)

#Show steps (see R script from class)
#y <- rexp(12,3)
#need to change the liklihood function to define the function  used desnsityexp. 
#instead use the mass function (density) for the poisson dplos
NLL <- function(lambda) -sum(dpois(y, lambda, log = TRUE))

fitexp <- mle(NLL, start = list(lambda = 2), nobs = NROW(y),
              method = "Brent", lower = 1, upper = max(y))

Answer1 <- fitexp #Replace with your answer.

### Problem 2
# Using 100 samples of size 20 from the standard normal, i.e. N(0,1),
# construct 100 intervals of confidence level 95%.


### Standard Normal
# We simulate and visualize confidence intervals

intervals <- 1:100
x <- rnorm(100)
mu <- mean(x)
z <- qnorm(.975) #alpha/2
lb <- mu - z/10
ub <- mu + z/10


for (i in intervals){
  x <- rnorm(20) #sample of 20 
  mu[i] <- mean(x)
  lb[i] <- mu[i] - z/sqrt(20)
  ub[i] <- mu[i] + z/sqrt(20)
}



# Store left endpoints and right endpoints 
# in separate vectors:

lefts <- ub
rights <- lb
#(Both must be vectors of size 100 once your loop has run.)

# How many of your intervals contain 0?

Answer2 <- sum((lb <= 0) & (ub >= 0)) #Replace with your answer

#(Note: this may differ from your friend's answer!)
 
