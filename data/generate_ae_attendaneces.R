library(tidyverse)
library(NHSRdatasets)

path <- "data/lesson_2"

# remove any csv's that exist in the folder
unlink(paste0(path, "/*.csv"))

# take the ae_attendances dataset, then create a file for each of the period's
ae_attendances %>%
  # nest all of the columns other than "period": this creates a row for each
  # period, then a tibble for all of the columns that are in that "group"
  nest(data = -period) %>%
  # iterate over each row of data, saving the data as a csv
  pwalk(function(period, data) {
    write_csv(data %>%
                # add the period column back into the data in the correct place
                mutate(period = period) %>%
                select(period, everything()),
              path = paste0("data/lesson_2/", period, ".csv"))
  })
