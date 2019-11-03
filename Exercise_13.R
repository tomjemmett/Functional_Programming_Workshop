# Exercise 13

library(tidyverse)

# let's recreate exercise 6, but use a fixed list of files.

files <- c("data/ae_attendances/2019-01-01.csv",
           "data/ae_attendances/2019-02-01.csv",
           "data/ae_attendances/2019-03-01.csv",
           "data/ae_attendances/2019-04-01.csv")

# note that the last file does not exist
file.exists(files)

col_types <- cols(
  period = col_date(format = ""),
  org_code = col_character(),
  type = col_character(),
  attendances = col_double(),
  breaches = col_double(),
  admissions = col_double()
)

# now, first try running the following:
map(files, read_csv, col_types = col_types)

# try to fix the above line with safely

map(files, safely(read_csv), col_types = col_types) %>%
  transpose() %>%
  pluck("result") %>%
  reduce(bind_rows)
