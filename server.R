#INFO 201 assignment 8 building apps server file
library(plotly)
library(shiny)
library(ggplot2)
library(dplyr)
library(scales)

#set working directory to folder with data
#setwd("~/UW Freshman Year/INFO 201/a8-building-apps-anuraagpolisetty/")

#read in cereal dataset
full.data <- read.csv('./data/police_killings.csv', stringsAsFactors = FALSE)

map.data <- MapData(full.data)
histogram.data <- HistogramData(full.data)
pie.data <- PieData(full.data)
bar.data <- BarData(full.data)

shinyServer(function(input, output) {
  output$Map <- renderPlotly({
    MapPlot(map.data, input)
  })
  
  output$Histogram <- renderPlotly({
    HistogramPlot(histogram.data, input)
  })
  
  output$Pie <- renderPlot({
    PiePlot(pie.data, input)
  })
  
  output$Bar <- renderPlotly({
    BarPlot(bar.data, input)
  })
})
