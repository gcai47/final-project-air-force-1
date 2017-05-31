library(plotly)

eval(parse(text = ))

ScatterPlot <- function(scatter.data, input) {
  plot <- plot_ly(scatter.data, ~eval(parse(text = input$ScatterX)), ~eval(parse(text = input$ScatterY)))
}