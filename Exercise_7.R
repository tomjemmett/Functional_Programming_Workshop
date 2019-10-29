# Exercise 7

library(tidyverse)

# lets reuse the datafreme created first in Exercise 2

set.seed(20191105)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

# now, let's say we want for each row to calculate the minimum of the a or b
# column and return it's value
df %>%
  select(a, b) %>%
  mutate(m = min(a, b))

# does this look correct?

# try re-writing this with map2_dbl

df %>%
  select(a, b) %>%
  mutate(m = YOUR_CODE_HERE)
