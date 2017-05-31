#Comments:
#Creates barplot function
#Takes data and input as parameters


BarPlot <- function(data, input){
  library(ggplot2)
  library(dplyr)
  
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
  
  return(ggplot(data, aes(x = info)) +
    geom_bar() +
    labs(title = "Bar Plot", x = xLab, y = "Number of Cases") 
  )
}
