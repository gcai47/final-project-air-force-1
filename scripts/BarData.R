library(dplyr)

BarData <- function(full.data) {
  data <- full.data %>%
    transmute(age, raceethnicity, state, cause, armed, avg_income = comp_income >= 1, county_bucket, nat_bucket)
  return(data)
}