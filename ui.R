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
               ),
               radioButtons("type.plot", label = "Data",
                            choices = list("Personal Income" = 'personal', "Comparative Income" = 'compared',
                                           'Unemployment' = 'unemployment', "College Degree Holders" = "college"), 
                            selected = 'personal')
               
      ),
      
      tabPanel("Scatter Plot", 
               titlePanel("Scatter Plot"),
               mainPanel(
                 plotlyOutput('Scatter')
               )
               
      ),
      
      tabPanel("Bar Graph",
               titlePanel("Bar Graph"),
               sidebarPanel(
                 radioButtons(inputId = "xaxis",
                             label = "X Axis",
                             choices = list("Age" = 'age', "Race/Ethnicity" = 'race', "State" = 'state',
                                            "Cause of Death" = 'cause', "Armed" = 'armed'),
                             selected= "race")
               ),
               mainPanel(
                 plotlyOutput('Bar')
               )
               
      )
    )
  )  
)
)