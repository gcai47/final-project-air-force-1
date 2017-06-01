# Creates an interactive user interface that allows the user to switch between different visual representations of police killings in 2015. 
# The widgets on the side can be used to adjust the data displayed. 

library(shiny)
library(plotly)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("sandstone"),
  mainPanel(
    titlePanel("Analysis Police Killings in the US"),
    tabsetPanel(
      # Introduces the project 
      tabPanel("Introduction",
               titlePanel("Our Mission"),
               mainPanel(
                 p("Welcome to our project! As a team, we decided to examine police homicide data and see what insights that we could draw out of it."),
                 p("The data set was obtained from the FiveThirtyEight blog. More information about the data can be found at the ", a("source", href = "https://github.com/fivethirtyeight/data/tree/master/police-killings"), "."), 
                 p("We are aware that is very sensitive information and can be politically and socially polarizing for many people. Our goal when creating this website was not to drive a political agenda, but rather to offer more information on the subject and display any trends so that viewers can draw their own opinions.", 
                   "We looked to provide all the necessary information to concerned citizens wanting to learn more about the relationship between police and population."),
                 p("Each page is layed out with interactive graphs that show different visualizations of our data. For some graphs, there will be descriptions and insights, but for the most part the interpretation is up to the viewer."),
                 p("We hope that we can shed more light on what is happening in these tragic incidents and help discover insights through data, rather than politics."),
                 strong("© Anuraag Polisetty, Gavin Cai, Richard Jiang, Zach Palmer June 2017")
               )),
      
      # Displays a visual map of the shootings
      tabPanel("Map",
               titlePanel("Map of Police Killings in 2015"),
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
                   plotlyOutput('Map', height = "150%", width = "150%"), 
                   helpText("The map displays the location where each case occurred. Hovering over a point will display information about the victim. The cases displayed can be filtered by race, gender, and whether the victim was armed or not.")
                 )
               )    
      ),
      
      # Displays information about the victims
      tabPanel("Victims",
               titlePanel("Overview of Victim Attributes"),
               sidebarPanel(
                 radioButtons(inputId = "xaxis",
                              label = "X Axis",
                              choices = list("Age" = 'age', "Race/Ethnicity" = 'race', "State" = 'state',
                                             "Cause of Death" = 'cause', "Armed" = 'armed'),
                              selected= "race")
               ),
               mainPanel(
                 plotlyOutput('Bar', height = "150%", width = "150%")
               )
               
      ), 
      
      # Displays information about the region where the victims lived
      tabPanel("Regions",
               titlePanel("Comparing Regions Where the Victims Lived"),
               
               sidebarPanel(
               radioButtons("type.plot", label = "Data",
                            choices = list("Personal Income" = 'personal', "Comparative Income" = 'compared',
                                           'Unemployment' = 'unemployment', "College Degree Holders" = "college"), 
                            selected = 'personal'),
               helpText("Comparative Income Score is how closely the household income of the victim matched the county income where they lived. A score of 100 meant that the victim's household had the exact same income as the county's average, a score of 50 means that the victim's household had half of the county's average income, etc.")
               ), 
               mainPanel(
                 plotlyOutput('Histogram', height = "150%", width = "150%"),
                 helpText("These histograms are meant to show how the victims of the killings compare to their greater surrounding region in terms of income, education, and unemployment")
               )
               
      ),
      
      # Allows the user to choose two categories to compare
      tabPanel("Comparison", 
               titlePanel("Comparing Attributes of Shooting Victims"),
               sidebarPanel(
                 selectInput("ScatterX", label = h3("Select X-Axis Variable"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "% Average Income" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'age'),
                 selectInput("ScatterY", label = h3("Select Y-Axis Variable"), 
                             choices = list("Age" = 'age', "Gender" = 'gender', "Ethnicity" = 'raceethnicity', "Cause of Death" = 'cause', "Victim's Arms" = 'armed', "Population of County" = 'pop', "Percentage of White Population" = 'share_white', "Percentage of Black Population" = 'share_black', "Percentage of Hispanic Population" = 'share_hispanic', "Personal Income" = 'p_income', "Household Income" = 'h_income', "Average County Income" = 'county_income', "% Average Income" = 'comp_income', "Quintile of County Income" = 'county_bucket', "Quintile of National Income" = 'nat_bucket', "County Poverty Rate" = 'pov', "County Unemployment Rate" = 'urate', "College Education Rate" = 'college'), 
                             selected = 'gender')
               ), 
               mainPanel(
                 plotlyOutput('Scatter', height = "150%", width = "150%")
               )
               
      )
    )
  )  
)
)