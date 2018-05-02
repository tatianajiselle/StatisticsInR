###
#CIS 321, Week 9
#We look again at basic models. 

#Let's load the data saved 
#in R object format

load('moddat')

str(olf)
str(software_failures)
str(ltsp)
str(waiting)

#Old Faithful Data
hist(olf, breaks = 20)
d <- density(olf)
plot(d, main = 'Kernel Density for Old Faithful')

#Interfailure times for software data
hist(software_failures, breaks = 20)
d <- density(software_failures)
plot(d, main = 'Kernel Density for Failures')

#Speed of Light (Michelson data)
hist(ltsp, breaks = 20)
d <- density(ltsp)
plot(d, main = 'Kernel Density for Speed of Light')

#Gamma data
hist(waiting,breaks = 20)
d <- density(waiting)
plot(d, main = 'Kernel Density for Gamma')

#Task is two-fold:
#1) Pick family of distributions.
#2) Estimate the best parameters.




#Finally, that linear model again...

jh <- read.table('jankahardness.txt')
y <- jh$V2
x <- jh$V1
my_model <- lm(y ~ x)
my_model
summary(my_model)
my_model$residuals
hist(my_model$residuals)
mean(my_model$residuals)

plot(jh)
abline(my_model)

#Models are not often linear.
#Let's see a quadratic relation...

pb <- read.csv('parab.csv')
y <- pb$y
x <- pb$tm
new_model <- lm(y ~ x)

plot(pb)
abline(new_model)


###
#Multiple Linear Regression follows
###

#We can do better!
x2 <- x**2
better_model <- lm(y ~ x + x2)
better_model
summary(better_model)
better_model$residuals
new_model$residuals
#(What is this?)

plot(pb)
#Now, we define a function in order to plot this fitted curve
cfs <- better_model$coefficients
pbline <- function(x) return(cfs[1] + x*cfs[2]+(x**2)*cfs[3])
curve(pbline(x), add=TRUE)



