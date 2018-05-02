###
#CIS 321, Week 10 
#Confidence intervals

#We'll calculate confidence intervals
#in a few different ways.

### Standard Normal
# We simulate and visualize confidence intervals

intervals <- 1:100
x <- rnorm(100)
mu <- mean(x)
z <- qnorm(.975)
lb <- mu - z/10
ub <- mu + z/10


for (i in intervals){
  x <- rnorm(100)
  mu[i] <- mean(x)
  lb[i] <- mu[i] - z/10
  ub[i] <- mu[i] + z/10
}

#Now that we have a bunch of intervals,
#we plot them with a special library.
library(plotrix)

plotCI(intervals, mu, li = lb, ui = ub)


#How many of our 100 intervals captured
#the true mean (0) ?
sum((lb <= 0) & (ub >= 0))


### Arbitary Normal, known variance
# (scaling to the standard)

stdev <- 2
intervals <- 1:100
#Note the change on the next line
x <- rnorm(100, 0, 2)
mu <- mean(x)
z <- qnorm(.975)
#Note another change on the next lines
lb <- mu - z*stdev/10
ub <- mu + z*stdev/10


for (i in intervals){
  x <- rnorm(100,0,2)
  mu[i] <- mean(x)
  lb[i] <- mu[i] - z*stdev/10
  ub[i] <- mu[i] + z*stdev/10
}

#Now that we have a bunch of intervals,
#we plot them with a special library.
library(plotrix)

plotCI(intervals, mu, li = lb, ui = ub)


#How many of our 100 intervals captured
#the true mean (0) ?
sum((lb <= 0) & (ub >= 0))

#Pretty close!




### T confidence intervals; unknown variance
# First, a look at the t-distribution

curve(dt(x,2), xlim = c(-3,3))
curve(dt(x,20),xlim = c(-3,3), add = TRUE)

#We get a random sample from a normal distribution

x <- rnorm(100,0,2)

# Now, let's calculate 95% CIs in two ways

# First, we'll use a handy built-in function

my_t_test <- t.test(x, conf.level = .95)
my_t_test$conf.int
my_t_test$conf.int[1]
#That gave the lower bound
my_t_test$conf.int[2]
     #That gave the upper bound


#We could also have calculated directly:

mu <- mean(x)
lb <- mu - qt(.975,length(x)-1)*sd(x)/sqrt(length(x))
ub <- mu + qt(.975,length(x)-1)*sd(x)/sqrt(length(x))
lb
ub

#The same!

#Now, let's check our confidence level

for (i in intervals){
  x <- rnorm(100,0,2)
  my_t_test <- t.test(x, conf.level = .95)
  mu[i] <- mean(x)
  lb[i] <- my_t_test$conf.int[1] 
  ub[i] <- my_t_test$conf.int[2] 
}

sum((lb <= 0) & (ub >= 0))


### Finally, let's see what happens with large samples
# We'll take advantage of CLT
# and use non-normal data!

intervals <- 1:1000

#Here's one interval:
x <- rpois(10, 2)
mu <- mean(x)
stdev <- sd(x)
z <- qnorm(.975)
lb <- mu - z*stdev/sqrt(length(x))
ub <- mu + z*stdev/sqrt(length(x))

#Now let's do many:
for (i in intervals){
  x <- rpois(10,2)
  mu[i] <- mean(x)
  stdev <- sd(x)
  lb[i] <- mu[i] - z*stdev/sqrt(length(x))
  ub[i] <- mu[i] + z*stdev/sqrt(length(x))
}

#How did we do? 
sum((lb <= 2) & (ub >= 2))

#Let's increase n, the sample size:

for (i in intervals){
  x <- rpois(10000,2)
  mu[i] <- mean(x)
  stdev <- sd(x)
  lb[i] <- mu[i] - z*stdev/sqrt(length(x))
  ub[i] <- mu[i] + z*stdev/sqrt(length(x))
}

#How about now?
sum((lb <= 2) & (ub >= 2))

