library(dplyr)

ScatterData <- function(full.data) {
  data <- full.data %>%
    transmute(age, gender, raceethnicity, cause, armed, pop, share_white, share_black, share_hispanic, p_income, h_income, county_income, comp_income = round(comp_income * 100, 2), county_bucket, nat_bucket, pov, urate = round(urate * 100, 2), college = round(college * 100, 2))
  return(data)
}

