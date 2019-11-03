# Exercise 10:

library(tidyverse)
library(NHSRdatasets)
library(rmarkdown)

if (!dir.exists("reports")) dir.create("reports")

org_codes <- ae_attendances %>%
  group_by(org_code) %>%
  filter(sum(type == 1) == 36) %>%
  pull(org_code) %>%
  as.character() %>%
  unique() %>%
  # only take the top 10 values otherwise it will take ages to run! 
  head(10)

render_report <- function(org_code) {
  filename <- glue::glue("reports/{org_code}.docx")
  # alternative, paste0("reports/", org_code, ".docx")
  
  render("ae_report.Rmd",
         output_format = "word_document",
         output_file = filename,
         params = list( org_code = org_code ))
}

walk(org_codes, render_report)

# you could also use an anonymous function/formula, like so:

walk(org_codes,
     ~render("ae_report.Rmd",
             output_format = "word_document",
             output_file = glue::glue("reports/{.x}.docx"),
             params = list( org_code = .x )))

# both will do exactly the same, it just depends on what you think is more readable
