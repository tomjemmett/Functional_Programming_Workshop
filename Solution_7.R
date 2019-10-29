# Solution 7

library(tidyverse)

set.seed(20191105)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df %>%
  select(a, b) %>%
  mutate(m = map2_dbl(a, b, min))

# note that this would also be possible without map by using the rowwise() function
# however, this would delete all of your previous groups (if you had any), and this
# function is marked as having a "questioning" lifecycle - it may not exist in
# future versions of dplyr.

df %>%
  select(a, b) %>%
  rowwise() %>%
  mutate(m = min(a, b))
