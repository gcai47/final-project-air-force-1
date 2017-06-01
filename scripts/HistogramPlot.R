library(tidytext)
library(plotly)

#Returns a plot_ly plot of a histogram based on the choice passed into it. 'data' is the data frame of the killings, and type.plot is the type of histogram passed in via radio buttons
HistogramPlot <- function(data, type.plot) {
  data$p_income <- as.numeric(data$p_income)
  return (switch (type.plot,
                  personaldata = plot_ly(data, x = ~p_income, type = "histogram") %>% layout(title = "Personal Income of Victims", yaxis = list(title = 'Count'), xaxis = list(title = 'Income($)')),
                  personal = plot_ly(data, alpha = 0.6) %>%
                    add_histogram(x = ~h_income, name = 'Tract Household Income') %>%
                    add_histogram(x = ~county_income, name = 'Average Household Income in County') %>%
                    layout(barmode = "overlay", title = "Tract-level Household Income vs County Average Household Income", yaxis = list(title = 'Count'), xaxis = list(title = 'Income ($)')),
                  compared = plot_ly(data, x = ~comp_income, type = "histogram") %>% layout(title = "Average Comparative Income", yaxis = list(title = 'Count'), xaxis = list(title = 'Comparative Income Score')),
                  unemployment = plot_ly(data, x = ~urate, type = "histogram") %>% layout(title = "Average County Unemployment", yaxis = list(title = 'Count'), xaxis = list(title = '% of People Unemployed')),
                  college = plot_ly(data, x = ~college, type = "histogram") %>% layout(title = "Number of People with College Degrees in County", yaxis = list(title = 'Count'), xaxis = list(title = '% of People with College Degrees'))))
}

