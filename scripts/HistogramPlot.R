library(tidytext)
library(plotly)

#Returns a plot_ly plot of a histogram based on the choice passed into it. 'data' is the data frame of the killings, and type.plot is the type of histogram passed in via radio buttons
HistogramPlot <- function(data, type.plot) {
  return (switch (type.plot,
                  personal = plot_ly(data, alpha = 0.6) %>%
                    add_histogram(x = ~p_income, name = 'Personal Income') %>%
                    add_histogram(x = ~county_income, name = 'Average Household Income in County') %>%
                    layout(barmode = "overlay", title = "Personal Income vs County Average Income", yaxis = list(title = 'Count'), xaxis = list(title = 'Income ($)')),
                  compared = plot_ly(data, x = ~comp_income, type = "histogram") %>% layout(title = "Average Comparative Income", yaxis = list(title = 'Count'), xaxis = list(title = 'Comparative Income Score')),
                  unemployment = plot_ly(data, x = ~urate, type = "histogram") %>% layout(title = "Average County Unemployment", yaxis = list(title = 'Count'), xaxis = list(title = '% of People Unemployed')),
                  college = plot_ly(data, x = ~college, type = "histogram") %>% layout(title = "Number of People with College Degrees in County", yaxis = list(title = 'Count'), xaxis = list(title = '% of People with College Degrees'))))
}

