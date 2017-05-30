library(tidytext)
library(plotly)

source('HistogramData.R')

source.data <- read.csv('~/info201hw/final-project-air-force-1/data/police_killings.csv', stringsAsFactors = FALSE)
killing.data <- HistogramData(source.data)

killing.data <- na.omit(killing.data)

killing.data[] <- lapply(killing.data, function(x) as.numeric(as.character(x)))

personal.income <- plot_ly(killing.data, alpha = 0.6) %>%
add_histogram(x = ~p_income) %>%
add_histogram(x = ~county_income) %>%
layout(barmode = "overlay")


compincome <- plot_ly(killing.data, x = ~comp_income, type = "histogram")

unemployment <- plot_ly(killing.data, x = ~urate, type = "histogram")


college <- plot_ly(killing.data, x = ~college, type = "histogram")


