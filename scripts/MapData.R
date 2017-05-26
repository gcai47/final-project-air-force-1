library(dplyr)

MapData <- function(full.data) {
  data <- full.data %>%
    select(name, age, gender, raceethnicity, city, state, latitude, longitude, cause, armed)
  return(data)
}