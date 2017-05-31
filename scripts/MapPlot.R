# Creates a map of the location of police killings in the United States. 
# Appearance of the map can be adjusted by user input. 

source("./scripts/MapData.R")
library(plotly)

MapPlot <- function(df, input) {
  g <- list(
    scope = "usa"
  )
  
  df <- df %>% mutate(text = paste0(name, ", ", age, ", ", gender, 
                                    " </br> Race: ", raceethnicity, 
                                    " </br> Location: ", city, ", ", state, 
                                    " </br> Armed with: ", armed))
  
  map <- plot_geo(df, locationmode = "USA-states") %>% 
    add_markers(
      x = ~longitude, y = ~latitude, color = ~armed, hoverinfo = "text", 
      text = ~text
    ) %>% 
    layout(title = "Location of Police Killings in 2015", geo = g)
  
  return(map)
}