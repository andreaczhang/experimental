# s3 
methods(summary) # prints a list of s3 methods 

# create obj, define class ----
x <- structure(list('apple'), class = 'fruit')
x

# define class later
y <- list('banana')
class(y) <- 'fruit'

# check
class(x)

inherits(x, 'fruit') # is x a fruit class object?

# inherits(x, 'character')

# multiple classes

# constructor ----

fruit <- function(x){
  stopifnot(is.character(x))# checks if x is char
  structure(list(fruit_name = x), class = 'fruit') 
}


fruit('pineapple')




# create s3 generics ----

# UseMethod
# 1. create the root 
quotation <- function(x){
  UseMethod('quotation')
}


# 2. create special case (methods)

quotation.fruit <- function(x){
  'Fruits are good for your health'
}

x # apple
class(x) # fruit 

# use quotation
quotation(x) # returns quotation.fruit() output 

mean.fruit <- function(x){5}
mean(x) # for fruit class obj, only returns 5



# looks too long, we modify the output 
# print.fruit()
pineapple <- fruit('pineapple') # created by the constructor
pineapple

# we do not need to define print() as generic, bec it IS already
# directly define print.fruit
print.fruit <- function(x){
  cat('I used constructor for my fruit:', x$fruit_name)
}

print.fruit(pineapple)




mysummary
# generic.class, class name needs to match your obj!
mysummary.numeric <- function(x){
  7
}
mysummary(3)



# ex ----
f <- function(x){UseMethod('f')} # define generic f
f.j <- function(x) x+2 # f method for class j
f.k <- function(x) x+10 # f method for class k

k <- 1
f(k) # returns error, class of k does not match!

# can check what f(k) tried 
# none of these exist 
sloop::s3_dispatch(f(k))

# fix: assign a class to k
class(k) <- 'j'
f(k) # k+2, f.j method



