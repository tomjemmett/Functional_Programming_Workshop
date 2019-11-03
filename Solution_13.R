# Solution 13

library(tidyverse)

files <- c("data/ae_attendances/2019-01-01.csv",
           "data/ae_attendances/2019-02-01.csv",
           "data/ae_attendances/2019-03-01.csv",
           "data/ae_attendances/2019-04-01.csv")

col_types <- cols(
  period = col_date(format = ""),
  org_code = col_character(),
  type = col_character(),
  attendances = col_double(),
  breaches = col_double(),
  admissions = col_double()
)

map(files, safely(read_csv), col_types = col_types)

# this result set isn't very useful unfortunately, you could (if you don't care
# about the error values) try running the below: first, it calls transpose, which
# rotates lists of lists, it then "plucks" just the result entry of the list,
# then it calls bind_rows to bind all of the results into a single dataframe

map(files, safely(read_csv), col_types = col_types) %>%
  transpose() %>%
  pluck("result") %>%
  bind_rows()
