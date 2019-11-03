# Exercise 5

library(tidyverse)

set.seed(20191105)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale <- function(x) {
  x_range <- range(x, na.rm = TRUE)
  
  # you could write it like this
  # (x - x_range[[1]]) / (x_range[[2]] - x_range[[1]])
  
  # but I prefer the following
  (x - x_range[[1]]) / diff(x_range)
}



# try using map, with the data frame as the first argument, and rescale as the
# second argument

# try using map_dfr instead of map