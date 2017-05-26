library(dplyr)

BarData <- function(full.data) {
  full.data <- read.csv('./data/police_killings.csv', stringsAsFactors = FALSE)
  data <- full.data %>%
    select()
  return(data)
}