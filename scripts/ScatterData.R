# Filters down the full data set so that only the relevant categories for creating a scatter plot are retained. 
library(dplyr)

# Filters down the full data set, retaining relevent catagories. Contains both continuous and non-continuous variables.
#   @param full.data  The full data set read in from a .csv file
ScatterData <- function(full.data) {
  data <- full.data %>%
    transmute(age = as.numeric(as.character(age)), gender, raceethnicity, cause, armed, pop = as.numeric(as.character(pop)), share_white = as.numeric(as.character(share_white)), share_black = as.numeric(as.character(share_black)), share_hispanic = as.numeric(as.character(share_hispanic)), p_income = as.numeric(as.character(p_income)), h_income = as.numeric(as.character(h_income)), county_income = as.numeric(as.character(county_income)), comp_income = round(comp_income * 100, 2), county_bucket, nat_bucket, pov = as.numeric(as.character(pov)), urate = round(urate * 100, 2), college = round(college * 100, 2))
  return(data)
}

