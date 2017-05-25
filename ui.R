#INFO 201 assignment 8 building apps user interface
library(shiny)

#Here you will define the functionality of your user interface
shinyUI(fluidPage(
  mainPanel(
    titlePanel("Police Killings in the US"),
    tabsetPanel(
      tabPanel("tab 1",
               titlePanel("Map"),
               mainPanel("US Map goes here")),
      
      tabPanel("tab 2",
               titlePanel("Graph")),
      
      tabPanel("tab 3", 
               titlePanel("Races of Casualties vs. Races of Cities"),
               textInput(inputId = "citysearch", label = "Search for a City:", value = "City Name"),
               selectInput(inputId = "city", 
                           label = "Select a City", 
                           choices = list("Los Angeles" = 'LA', "Houston" = 'Hous'),
                           selected = "Los Angeles"),
               plotOutput("RaceKillings")
               ),
      
      tabPanel("tab 4",
               titlePanel("idk"))
      )

  
    )  
  )
)