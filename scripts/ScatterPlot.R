# Creates a scatter plot comparing attributes of police killings in the United States. 
# Both the X and Y variables are chosen by the user.
# The X variable denoted by outline color and the Y variable denoted by fill color.
# Selectable variables include continuous and non-continous variables.

library(plotly)

# Generates a scatter plot compating attributes of police killings.
#   @param scatter.data     The data frame contaning the data to be graphed
#   @param input  Contains the user selected X and Y axes variables. 
#   @return       Returns a scatter plot with the selected X and Y axes. 
ScatterPlot <- function(scatter.data, input) {
  # Selects the appropriate name fo X variable
  if (input$ScatterX == 'age') {
    x <- "Age"
  } else if (input$ScatterX == 'gender') {
    x <- "Gender"
  } else if (input$ScatterX == 'raceethnicity') {
    x <- "Ethnicity"
  } else if (input$ScatterX == 'cause') {
    x <- "Cause of Death"
  } else if (input$ScatterX == 'armed') {
    x <- "Victim's Arms"
  } else if (input$ScatterX == 'pop') {
    x <- "Population of County"
  } else if (input$ScatterX == 'share_white') {
    x <- "Percentage of White Population"
  } else if (input$ScatterX == 'share_black') {
    x <- "Percentage of Black Population"
  } else if (input$ScatterX == 'share_hispanic') {
    x <- "Percentage of Hispanic Population"
  } else if (input$ScatterX == 'p_income') {
    x <- "Personal Income"
  } else if (input$ScatterX == 'h_income') {
    x <- "Household Income"
  } else if (input$ScatterX == 'county_income') {
    x <- "% Average Income"
  } else if (input$ScatterX == 'comp_income') {
    x <- "Income Relative to Average" 
  } else if (input$ScatterX == 'county_bucket') {
    x <- "Quintile of County Income"
  } else if (input$ScatterX == 'nat_bucket') {
    x <- "Quintile of National Income"
  } else if (input$ScatterX == 'pov') {
    x <- "County Poverty Rate"
  } else if (input$ScatterX == 'urate') {
    x <- "County Unemployment Rate"
  } else if (input$ScatterX == 'college') {
    x <- "College Education Rate"
  }
  
  # Selects the appropriate name fo Y variable
  if (input$ScatterY == 'age') {
    y <- "Age"
  } else if (input$ScatterY == 'gender') {
    y <- "Gender"
  } else if (input$ScatterY == 'raceethnicity') {
    y <- "Ethnicity"
  } else if (input$ScatterY == 'cause') {
    y <- "Cause of Death"
  } else if (input$ScatterY == 'armed') {
    y <- "Victim's Arms"
  } else if (input$ScatterY == 'pop') {
    y <- "Population of County"
  } else if (input$ScatterY == 'share_white') {
    y <- "Percentage of White Population"
  } else if (input$ScatterY == 'share_black') {
    y <- "Percentage of Black Population"
  } else if (input$ScatterY == 'share_hispanic') {
    y <- "Percentage of Hispanic Population"
  } else if (input$ScatterY == 'p_income') {
    y <- "Personal Income"
  } else if (input$ScatterY == 'h_income') {
    y <- "Household Income"
  } else if (input$ScatterY == 'county_income') {
    y <- "% Average Income"
  } else if (input$ScatterY == 'comp_income') {
    y <- "Income Relative to Average" 
  } else if (input$ScatterY == 'county_bucket') {
    y <- "Quintile of County Income"
  } else if (input$ScatterY == 'nat_bucket') {
    y <- "Quintile of National Income"
  } else if (input$ScatterY == 'pov') {
    y <- "County Poverty Rate"
  } else if (input$ScatterY == 'urate') {
    y <- "County Unemployment Rate"
  } else if (input$ScatterY == 'college') {
    y <- "College Education Rate"
  }
  
  # Generates a jittered scatter plot with the chosen X and Y axes with outline color coresponding to X 
  # and fill color coresponding to Y.s
  ggp <- ggplot(scatter.data, aes(x = eval(parse(text = input$ScatterX)), y = eval(parse(text = input$ScatterY)), colour = eval(parse(text = input$ScatterX)), fill = eval(parse(text = input$ScatterY)))) +
    geom_point(position = 'jitter', na.rm = TRUE) +
    labs(title = paste0(x, ' vs. ', y, ' of Shooting Victims'), x = x, y = y, colour = x) +
    theme(legend.position = 'none')
  
  # Converts to plotly graph and removes hoverinfo
  plot <- ggplotly(ggp, tooltip = NULL)
  return(plot)
}