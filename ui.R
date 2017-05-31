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
      
      tabPanel("Scatter Plot", 
               titlePanel("Scatter Pot"),
               mainPanel(
                 plotlyOutput('Scatter')
               ),
               sidebarPanel(
                 selectInput("ScatterX", label = h3("X-Axis"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "Income Relative to Average" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'age'),
                 selectInput("ScatterY", label = h3("Y-Axis"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "Income Relative to Average" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'gender')
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