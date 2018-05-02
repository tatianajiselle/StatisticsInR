#This is a comment. Anything on this line will be ignored by R.


##########
#HW 2, CIS321
#Complete this script to compute probabilities.
#Rename the script "<yourBlackboardUsername>-hw2.R".
#Upload your completed and renamed script to Blackboard after you have confirmed that it runs without error.
#Full Name: Tatiana Jiselle Ensslin
#Syr Email Address: tjenssli@syr.edu  
#Date: Feb 3rd, 2016
##########

###Introduction###

#To use R in 'calculator mode', simply type the expression you want at the prompt and hit return

4-(6/(11.5-pi))

#(this comes out to ~3.28216)
#We can save data to a variable; use '<-' for this.

x <- seq(from = 1, to = 50)
y <- 1:50

#Above, we have assigned the vector of ints 1, 2, ..., 50 to x and to y.
#To see what's stored in a variable, we may print it.

x

#We can also explicitly call the function 'print' on the variable.

print(x)

#If we want information about type, then we can call 'str' on the object.

str(x)

#This shows us what type of thing x is.
#The first variable, x, was defined using the 'seq' function. This stands for sequence. Let's learn about that function.

help(seq)

#The above brings up a help window. We've just used some of R's built-in functions.

help(help)
help(str)
help(print)

#We can compare the results of assignment to x and to y

x == y

#This returns boolean values (True/False) for each pair of elements in the lists.
#We can even assign the result to a new variable.

z <- x==y
str(z)

#We can also sum up values in a vector

sum(x)

#We can 'slice' a vector.

x[2:5]

#(the above returns the second, third, fourth and fifth values in x, yielding a vector of length 4)
#Again, we can assign the result to another variable.

z <- x[2:5]

#We can combine slicing and summing.

sum(x[2:5])

#We can do a for-loop through some values, printing the results of some computations.

for (i in 1:3) {print(  sum(z[1:i])  )}

#For help with loops, try the help function again (note the use of "").

help("for")

#Now would be a good time to explore the resulting documenation on control flow (if, for, while, repeat, break, next).


#We can also assign values to a vector inside a loop.

w <- 0
for (i in 1:10) { w[i+1] <- x[i] }

#Note that indexing starts at 1 and not 0.


###PROBLEMS###

##Problem 1:  compute the probability AuB described below.

#Let A and B be events in a sample space. Suppose that...

#A denotes the probability of A, i.e. P(A)

A <- 1/3

#BgAc denotes the conditional probability of B given A-complement, i.e. P(B|A^c)

BgAc <- 1/4

# and AuB denotes the probability of the union of A and B ("A or B").

AuB <- 1/2 #REPLACE 0 with your answer.

#Your answer must be in terms of A and BgAc.
#Hint: recall the definition of conditional probability.
#Recall the Law of Total Probability.
#Use scratch paper.


##Problem 2: Use the functions dbinom and pbinom to compute probabilities.

#First, learn about dbinom.

help(dbinom)

#We toss a fair coin 100 times. What is the probability the coin comes up heads exactly 50 times? Here is the answer:

dbinom(50, 100, .5)

#What is the probability the coin comes up heads an even number of times? Here is the answer:

x <- seq(from = 0, to = 100, by = 2)
p <- dbinom(x,100,.5)
sum(p)

#What is the probability the coin comes up heads at least 37 times?

Answer2a <- dbinom(37:100,100,.5) #REPLACE 0 with the code giving your answer. .0026

#What is the probability the coin comes up heads at least 20 times but no more than 60 times?
k <- dbinom(20:60,100,.5)
Answer2b <- sum (k)
 #REPLACE 0 with the code giving your answer, must use dbinom function.

#Now, let's learn about the pbinom function.

help(pbinom)

#This is the cumulative probability distribution - it more easily computes probability of landing in some range.

#Same question, different answer: what is the probability the coin comes up heads at least 20 times but no more than 60 times?
f <- pbinom(60,100,.5) - pbinom(20,100,.5) 
Answer2c <- sum(f) #Replace 0 with the code giving your answer; must use pbinom function 


##Problem 3

#First, learn about the dgeom and pgeom functions

help(dgeom)
help(pgeom)

#You are tossing a coin which comes up heads with probbility .3
#What is the probability that you'll have to toss it 10 to 20 times in order to get the first heads?
g <- dgeom(9:19,.3)
Answer3 <- sum(g) #REPLACE 0 with the code giving your answer; must use pgeom or dgeom.

#Hint: be careful! Read the documentation; off-by-one errors are lurking.

