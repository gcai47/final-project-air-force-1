# Creates a map of the location of police killings in the United States. 
# Color of the map can be adjusted based on a data set chosen by the user. 
# The number of cases displayed can also be adjusted based on user selected data.

library(plotly)

# Generates a map of the United States plotting the location of police killings. Filters the data based on user input. 
#   @param df     The data frame of cases to plot
#   @param input  Contains the user selected data passed from the UI file. 
#   @return       Returns a map with all selected cases plotted. 
MapPlot <- function(df, input) {
  g <- list(
    scope = "usa"
  )
  
  df <- df %>% mutate(text = paste0(name, ", ", age, ", ", gender, 
                                    " </br> Race: ", raceethnicity, 
                                    " </br> Location: ", city, ", ", state, 
                                    " </br> Armed with: ", armed))
  
  # Filters down the number of cases displayed based on user data. 
  if (input$maprace != "All") {
    df <- df %>% filter(raceethnicity == input$maprace)
  }
  if (input$mapgender != "All") {
    df <- df %>% filter(gender == input$mapgender)
  }
  if (input$maparmed != "All") {
    df <- df %>% filter(armed == input$maparmed)
  }
  
  # Generates a map of the United States with all values chosen by the user plotted. 
  map <- plot_geo(df, locationmode = "USA-states") %>% 
    add_markers(
      x = ~longitude, y = ~latitude, color = ~eval(parse(text = input$mapcolor)), hoverinfo = "text", 
      text = ~text
    ) %>% 
    layout(title = "Location of Police Killings in 2015", geo = g)
  
  return(map)
}