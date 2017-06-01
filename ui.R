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
               sidebarLayout(
                 sidebarPanel(
                   radioButtons(inputId = "mapcolor", label = "Color by: ", 
                                choices = list("Race" = "raceethnicity", "Gender" = "gender", "Armed With" = "armed"), 
                                selected = "armed"), 
                   selectInput(inputId = "maprace", label = "Race to Display: ", 
                               choices = list("All", "White", "Black", "Hispanic/Latino", "Native American", "Asian/Pacific Islander", "Unknown"), 
                               selected = "All"), 
                   selectInput(inputId = "mapgender", label = "Gender to Display: ", 
                               choices = list("All", "Male", "Female"), 
                               selected = "All"),
                   selectInput(inputId = "maparmed", label = "Weapons to Display: ", 
                               choices = list("All", "Unarmed" = "No", "Firearm", "Non-lethal firearm", "Knife", "Vehicle", "Disputed", "Unknown", "Other"), 
                               selected = "All")
                 ), 
                 mainPanel( 
                   plotlyOutput('Map', height = "150%", width = "150%")
                 )
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
      
      tabPanel("Attributes", 
               titlePanel("Comparing Attributes of Shooting Victims"),
               mainPanel(
                 plotlyOutput('Scatter')
               ),
               sidebarPanel(
                 selectInput("ScatterX", label = h3("Select X-Axis Variable"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "% Average Income" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'age'),
                 selectInput("ScatterY", label = h3("Select Y-Axis Variable"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "% Average Income" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'gender')
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