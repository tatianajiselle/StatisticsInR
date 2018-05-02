###
#CIS 321, Week 9
#We look again at estimators 

#The Residual Sum of Squares:
rss <- function(model) {sum(model$residuals^2)}

#Using the hardness example
jh <- read.table('jankahardness.txt')
density_model <- lm(V2 ~ V1, data = jh)
rss(density_model)

#Let's simulate Tank Serial Number Data
tanks <- 1:1000

#That was easy. Now let's describe our two estimators:

T1 <- function(x) { 2*mean(x) - 1 }
T2 <- function(x) { (11/10)*max(x) - 1 }

#Great, these are function - we need to call them on data...

#We'll use the 'sample' function in a loop

T1_sample <- 0
T2_sample <- 0

for (i in 1:2000){
    T1_sample[i] <- T1(sample(tanks,10))
    T2_sample[i] <- T2(sample(tanks,10))
}

hist(T1_sample, breaks = 20, xlim = c(400, 1600))
hist(T2_sample, breaks = 20, xlim = c(400,1600))

var(T1_sample)
var(T2_sample)

    

