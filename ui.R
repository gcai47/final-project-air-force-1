library(shiny)
library(plotly)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("sandstone"),
  mainPanel(
    titlePanel("Police Killings in the US"),
    tabsetPanel(
      tabPanel("Introduction",
               titlePanel("Our Project"),
               mainPanel(
                 p("Welcome to our project! As a team, we decided to examine police homicide data and see what insights that we could draw out of it."),
                 p("We are aware that is very sensitive information and can be politically/socially polarizing for many people. Our goal when creating this website was not to drive a political agenda, but rather to offer more information on the subject so that any viewers can make their own opinions"),
                 p("Each page is layed out with interactive graphs that show different visualizations of our data. For some graphs, there will be descriptions and insights, but for the most part the interpretation is up to the viewer"),
                 p("We hope that we can shed more light on what is happening in these tragic incidents and help discover insights through data, rather than politics"),
                 strong("© Anuraag Polisetty, Gavin Cai, Richard Jiang, Zach Palmer June 2017")
               )),
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
                 plotlyOutput('Histogram'),
                 helpText("These histograms are meant to show how the victims of the killings compare to their greater surrounding region in terms of income, education, and unemployment")
               ),
               sidebarPanel(
               radioButtons("type.plot", label = "Data",
                            choices = list("Personal Income" = 'personal', "Comparative Income" = 'compared',
                                           'Unemployment' = 'unemployment', "College Degree Holders" = "college"), 
                            selected = 'personal'),
               helpText("Comparative Income Score is how closely the household income of the victim matched the county income where they lived. A score of 100 meant that the victim's household had the exact same income as the county's average, a score of 50 means that the victim's household had half of the county's average income, etc.")
               )
               
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