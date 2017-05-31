#Comments:
#Creates barplot function
#Takes data and input as parameters


library(dplyr)

BarPlot <- function(data, input){
  library(ggplot2)
  
  if(input$xaxis == "age"){
    plot.data <- data %>% filter(age)
  } else if (input$xaxis == "raceethnicity") {
    plot.data <- data %>% filter(raceethnicity)
  } else if (input$xaxis == "state") {
    plot.data <- data %>% filter(state)
  } else if (input$xaxis == "cause") {
    plot.data <- data %>% filter(cause)
  } else {
    plot.data <- data %>% filter(armed)
  }
  
  p <- ggplot(plot.data, aes(x = input$xaxis)) +
    geom_bar() +
    labs(title = "Bar Plot", x = input, y = "Number of Cases")
  
  return(p)
}
