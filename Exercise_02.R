# Exercise 2

# Lets set a seed to the random number generator, that way we will all get the
# same data frame :-)
set.seed(20191105)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

# have a look at the values
df
# each column has a mixture of positive and negative values, centered around 0

# create a function called rescale
# rescale takes an argument x which is a vector of numerics and returns a vector
# the same length as x where each value is between 0 and 1 with the largest
# value of x = 1 and the smallest value of x = 0

# it takes each value of x and subtracts the minimum value of x, then divides 
# by the range - the maximum value of x minus the minimum value of x

rescale <- function(x) {
  ##############################################################################
  # your code here
  ##############################################################################
}

# then try out your new function by updating each of the columns of df with the
# rescaled value

