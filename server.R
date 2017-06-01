# Server used to host the application. 
# Creates the plots displayed to the user and considers user input. 

library(plotly)
library(shiny)

source('./scripts/MapData.R')
source('./scripts/HistogramData.R')
source('./scripts/ScatterData.R')
source('./scripts/BarData.R')
source('./scripts/MapPlot.R')
source('./scripts/HistogramPlot.R')
source('./scripts/ScatterPlot.R')
source('./scripts/BarPlot.R')

full.data <- read.csv('./data/police_killings.csv', stringsAsFactors = FALSE)

# Read in data to be used for each plot. 
map.data <- MapData(full.data)
histogram.data <- HistogramData(full.data)
scatter.data <- ScatterData(full.data)
bar.data <- BarData(full.data)

# Generate output plots displayed in UI. 
shinyServer(function(input, output) {
  output$Map <- renderPlotly({
    MapPlot(map.data, input)
  })
  
  output$Histogram <- renderPlotly({
    HistogramPlot(histogram.data, input$type.plot)
  })
  
  output$Scatter <- renderPlotly({
    ScatterPlot(scatter.data, input)
  })
  
  output$Bar <- renderPlotly({
    BarPlot(bar.data, input)
  })
})