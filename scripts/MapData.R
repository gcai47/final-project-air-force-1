# Filters down the full data set so that only the relevant categories for creating a map are retained. 

library(dplyr)

# Filters down the full data set, keeping only information relevant to mapping. 
#   @param full.data  The full data set read in from a .csv file
MapData <- function(full.data) {
  data <- full.data %>%
    select(name, age, gender, raceethnicity, city, state, latitude, longitude, cause, armed)
  return(data)
}