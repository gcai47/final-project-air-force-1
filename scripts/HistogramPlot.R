library(tidytext)
library(plotly)

HistogramPlot <- function(data, type.plot) {
  return (switch (type.plot,
                  personal = plot_ly(data, alpha = 0.6) %>%
                    add_histogram(x = ~p_income) %>%
                    add_histogram(x = ~county_income) %>%
                    layout(barmode = "overlay"),
                  compared = plot_ly(data, x = ~comp_income, type = "histogram"),
                  unemployment = plot_ly(data, x = ~urate, type = "histogram"),
                  college = plot_ly(data, x = ~college, type = "histogram")))
}
