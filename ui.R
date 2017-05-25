#INFO 201 assignment 8 building apps user interface
library(shiny)
library(plotly)

#Here you will define the functionality of your user interface
shinyUI(fluidPage(
  mainPanel(
    titlePanel("Police Killings in the US"),
    tabsetPanel(
      tabPanel("Map",
               titlePanel("Map"),
               mainPanel(
                 plotlyOutput('Map')
               )
               
               ),
      
      tabPanel("Histogram",
               titlePanel("Histogram"),
               mainPanel(
                 plotlyOutput('Histogram')
               )
               
               ),
      
      tabPanel("Pie Chart", 
               titlePanel("Races of Casualties vs. Races of Cities"),
               sidebarPanel(
                  textInput(inputId = "citysearch", label = "Search for a City:", value = "City Name"),
                  selectInput(inputId = "city", 
                           label = "Select a City", 
                           choices = list("Los Angeles" = 'LA', "Houston" = 'Hous'),
                           selected = "Los Angeles")
               ),
               mainPanel(
                 plotlyOutput('Pie')
               )
               
               ),
      
      tabPanel("Bar Graph",
               titlePanel("Bar Graph"),
               mainPanel(
                 plotlyOutput('Bar')
               )
               
               )
      )
    )  
  )
)