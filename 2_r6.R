library(R6)
# R6Class(), define new object class

# classname, public

# this creates a class: Accumulator
# one public field, sum (with initial value 0)
# one public method, add()

Accumulator <- R6Class(
  classname = "Accumulator", 
  public = list(
    sum = 0, 
    add = function(x=1){
      self$sum <- self$sum + x
      invisible(self)
    }
  )
)

Accumulator
# object generator

# create new object
# x is an instance of Accumulator class
x <- Accumulator$new()
x

x$sum # 0

x$add()
x$sum # 1

x$add(3)
x$sum # 4

# chain together
x$add(10)$add(10)$sum


# initialize method ----
# overrides $new(), modifies existing


Person <- R6Class(
  classname = 'Person', 
  public = list(
    name = NULL,
    age = NA, 
    initialize = function(name, age = NA){
      # checks 
      stopifnot(is.character(name), length(name) == 1)
      stopifnot(is.numeric(age), length(age) == 1)
      # assign values
      self$name <- name
      self$age <- age
    }
  )
)

# create new instances 
hadley <- Person$new('Hadley', age = 'thirty')
# second check fails

hadley <- Person$new('Hadley', age = 38)
hadley


# print method ----

Person <- R6Class(
  classname = 'Person', 
  public = list(
    name = NULL,
    age = NA, 
    # first method
    initialize = function(name, age = NA){
      # checks 
      stopifnot(is.character(name), length(name) == 1)
      stopifnot(is.numeric(age), length(age) == 1)
      # assign values
      self$name <- name
      self$age <- age
    }, 
    # add a second method: prints in the way you prefer
    print = function(...){
      cat('Person: \n')
      cat('  Name:', self$name, '\n')
      cat('  Age:', self$age, '\n')
      invisible(self)
    }
  )
)

person2 <- Person$new('Hadley', 38)
person2 # custom print method 

# person 2 has the print method; 
# hadley does not. 
# method is bound to objects

# inheritance ----

AccumulatorChatty <- R6Class(
  'AccumulatorChatty',  # classname
  inherit = Accumulator, # inherits (superclass)
  public = list(
    add = function(x = 1){
      cat('Adding ', x, '\n', sep = '')
      super$add(x = x) # super class
    }
  )
)

x2 <- AccumulatorChatty$new()
x2$add(10)
x2$add(10)$sum


class(hadley)
class(x2) # returns the class it inherits from 

names(hadley)
names(x2)
# all have clone


# reference semantics ----
# confusing
x <- Accumulator$new()
x
y <- x
y$add(10)
y$sum
x$sum # x sum also changed, even though we only changed y

# clone 

x <- Accumulator$new()
x$sum
y <- x$clone() # create a clone 
y$add(10) # change y
y$sum 
x$sum # x remains unchanged 
