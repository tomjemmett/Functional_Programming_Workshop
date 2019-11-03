# Exercise 4

library(tidyverse)

# let's recreate my_function from Exercise 1

my_function <- function(x) {
  3 * x + 1
}

# try using map with a vector of numbers, e.g. 1:10

# try map_dbl, how are the results different?

# what happens when you run my_function with a vector of values instead of a
# single value?

# try using map/map_dbl with a formula instead of the function
# ~ 3 * .x + 1
# (note that this argument is dot x)
