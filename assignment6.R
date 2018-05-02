##########
#HW 6, CIS321
#Complete the questions below 
#Upload your completed file Blackboard after you have confirmed that it runs without error.
#Fill in your details below.
#Full Name: Tatiana J Ensslin
#Syr Email Address: tjenssli@syr.edu  
#Date: March 31st, 2016
##########

### Problem 0
# Load the 'hwdat' file using 'load' function.
#(Nothing to report here, but you will need the objects.)

load('hwdat') #note this requires setting the working directory with setwd("")

### Problem 1
# 'binom_dat' contains samples
# from a binomial distribution. Estimate...

#the size (number of trials 'n') of this RV 
#(Show your work)

A <- mean(binom_dat)
B <- var(binom_dat)
#2.724 = np = A
#1.67905 = np(1-p) = B
# n<- 2.724/p
# 1.67905 = (2.724/p)p(1-p)
# 1.67905 = 2.724(1-p)
# 1.67905 = 2.724-2.724p
# p = .3834
# 2.724 / .3834 = n
# n = 7.10411

Answer1a <- 7.10411 #Replace 0 with your answer

#the probability of success (value of 'p') for this RV
#(show your work)
#2.724 = np = A
#1.67905 = np(1-p) = B
# n<- 2.724/p
# 1.67905 = (2.724/p)p(1-p)
# 1.67905 = 2.724(1-p)
# 1.67905 = 2.724-2.724p
# p = .3834

Answer1b <- .3834 #Replace 0 with your answer 

### Problem 2
# 'model_frame' is a data frame with three labeled columns
# Extract from 'model_frame'...

#the column, other than 'rating', which best predicts 'rating'
#(Show your work)
C <- lm(rating~hp,data=model_frame)
D <- lm(rating~wt,data=model_frame)
E <- lm(rating~qsec,data=model_frame)

#The Residual Sum of Squares function:
rss <- function(model) {sum(model$residuals^2)}

rssC <- rss(C)
rssD <- rss(D)
rssE <- rss(E)

#print results
rssC 
rssD
rssE

Answer2a <- wt #Replace 0 with answer (THIS IS WT)
#Note: above Answer2a must be sequence or one-column frame

#The residual sum of squares (RSS) for this best model
#(Show your work)  

#The Residual Sum of Squares function:
rss <- function(model) {sum(model$residuals^2)}

rssC <- rss(C)
rssD <- rss(D)
rssE <- rss(E)

#print results
rssC 
rssD
rssE

Answer2b <- rssD #Replace 0 with your answer


