#Comments:
# This function takes in user input to display different types of data on a bar plot

BarPlot <- function(data, input){
  library(ggplot2)
  library(dplyr)
  
  # filters data used in barplot based on user input for the x axis
  if(input$xaxis == "age"){
    bar.data <- data %>% select(age)
    info = data$age
    xLab = "Age"
  } else if (input$xaxis == "race") {
    bar.data <- data %>% select(raceethnicity)
    info = data$raceethnicity
    xLab = "Race/Ethnicity"
  } else if (input$xaxis == "state") {
    bar.data <- data %>% select(state)
    info = data$state
    xLab = "State"
  } else if (input$xaxis == "cause") {
    bar.data <- data %>% select(cause)
    info = data$cause
    xLab = "Cause of Death"
  } else {
    bar.data <- data %>% select(armed)
    info = data$armed
    xLab = "Armed"
  }
  
  #renders the bar plot using the selected data and colored according to race
  return(ggplot(data, aes(x = info, fill = (raceethnicity))) +
    geom_bar() +
    labs(title = "Number of Deaths Compared to Victim Attributes", x = xLab, y = "Number of Cases") + 
    labs(fill = "Race/Ethnicity")

  )
}
