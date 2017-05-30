library(dplyr)

HistogramData <- function(full.data) {
  data <- full.data %>%
    transmute(age, p_income, h_income, county_income, comp_income = round(comp_income * 100, 2), pov, urate = round(urate * 100, 2), college = round(college * 100, 2))

  return(data)
}