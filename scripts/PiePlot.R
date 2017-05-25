PiePlot <- function(data, input) {
  if(input$city == "LA"){
    plot.data <- data %>% filter(city == "Los Angeles")
  } else {
    plot.data <- data %>% filter(city == "Houston")
  }
  # 
  # if(input$info == 'calories') {
  #   info = plot.data$calories
  #   xlabel = "Calories"
  # } else if(input$info == 'sugar') {
  #   info = plot.data$sugars
  #   xlabel = "Sugar (grams)" 
  # } else if (input$info == 'carbs') {
  #   info = plot.data$carbo
  #   xlabel = "Carbohydrates (grams)"
  # } else {
  #   info = plot.data$potass
  #   xlabel = "Potassium (milligrams)"
  # }
  
  #plot data
  ggplot(plot.data, aes(x = "", y = value, fill=group))+
    geom_bar(width = 1, stat = "identity")
  # pie + scale_fill_grey() +  blank_theme +
  #   theme(axis.text.x=element_blank()) +
  #   geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), 
  #                 label = percent(value/100)), size=5)
  # ggplot(plot.data, aes(x = info, y = rating, color = factor(mfr)))+ geom_point(size=3) +
  #   labs(title = "Cereal Rating vs Nutritional Information", x = xlabel) + 
  #   guides(color=guide_legend(title="Manufacturer"))
  
}