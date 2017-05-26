library(plotly)
library(shiny)
library(ggplot2)
library(dplyr)
library(scales)

source('./scripts/MapData.R')
source('./scripts/HistogramData.R')
source('./scripts/PieData.R')
source('./scripts/BarData.R')
source('./scripts/MapPlot.R')
source('./scripts/HistogramPlot.R')
source('./scripts/PiePlot.R')
source('./scripts/BarPlot.R')

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
