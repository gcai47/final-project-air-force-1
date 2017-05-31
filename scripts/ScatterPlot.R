library(plotly)

ScatterPlot <- function(scatter.data, input) {
  ggp <- ggplot(scatter.data, aes(x = eval(parse(text = input$ScatterX)), y = eval(parse(text = input$ScatterY)), colour = eval(parse(text = input$ScatterX)))) +
    geom_point(position = 'jitter', na.rm = TRUE) +
    labs(title = paste0(input$ScatterX, ' vs. ', input$ScatterY), x = input$ScatterX, y = input$ScatterY)
  
  # Converts to plotly graph and adds hovertext
  plot <- ggplotly(ggp)
  return(plot)
}