# Solution


library(tidyverse)
library(NHSRdatasets)

# Let's inspect the ae_attendances dataset
ae_attendances

# This dataset contains one 1 row per combindation of:
#  * month (period)
#  * organisation (org_code)
#  * A&E department type (type)

# Let's create a plot that shows the attendances over time, we will need to
# summarise our data to have just 1 row per month:
ae_df <- ae_attendances %>%
  group_by(period) %>%
  summarise_at(vars(attendances), sum)

ae_attendances_plot <- function(data, title) {
  ae_df <- data %>%
    group_by(period) %>%
    summarise_at(vars(attendances), sum)
  
  ggplot(ae_df, aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = title)
}

# you could also just do it in one
ae_attendances_plot <- function(data, title) {
  data %>%
    group_by(period) %>%
    summarise_at(vars(attendances), sum) %>%
    
    ggplot(aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = title)
}

ae_attendances %>%
  ae_attendances_plot("A&E Attendances")

ae_attendances %>%
  filter(type == "1") %>%
  ae_attendances_plot("A&E Attendances (Type 1 only)")

ae_attendances %>%
  filter(org_code == "RF4") %>%
  ae_attendances_plot("A&E Attendances (RF4 only)")