library(dplyr)

BarData <- function(full.data) {
  full.data <- read.csv('./data/police_killings.csv', stringsAsFactors = FALSE)
  data <- full.data %>%
    group_by(city, state) %>%
    summarise(share_white = share_white, share_black = share_black[1], share_hispanic = share_hispanic[1], count = n())
  return(data)
}