# Solution 2

set.seed(20191105)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale <- function(x) {
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# alternatively:

rescale <- function(x) {
  x_min <- min(x, na.rm = TRUE)
  x_max <- max(x, na.rm = TRUE)
  x_range <- x_max - x_min
  
  (x - x_min) / x_range
}

# or:

rescale <- function(x) {
  x_range <- range(x, na.rm = TRUE)
  
  # you could write it like this
  # (x - x_range[[1]]) / (x_range[[2]] - x_range[[1]])
  
  # but I prefer the following
  (x - x_range[[1]]) / diff(x_range)
}

df$a <- rescale(df$a)
df$b <- rescale(df$b)
df$c <- rescale(df$c)
df$d <- rescale(df$d)

# or
library(tidyverse) # make sure tidyverse is loaded

df <- df %>%
  mutate(a = rescale(a),
         b = rescale(b),
         c = rescale(c),
         d = rescale(d))

# you could also be clever and use

df <- df %>%
  mutate_at(vars(a:d), rescale)
