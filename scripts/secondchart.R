library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(stringr)


data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv", stringsAsFactors = FALSE)

second_new_chart <- function(df, number, colour_bar) {
  
  number <- as.numeric(number)
  
  bar_graph <- df %>%
    group_by(province) %>%
    summarise(total_num_restaurants = n()) %>%
    top_n(number) %>%
    plot_ly(
      type = "bar",
      x = ~province,
      y = ~total_num_restaurants,
      color = I(colour_bar)
    ) %>%
    layout(
      xaxis = list(title = "State (Abr.)"),
      yaxis = list(title = "Total Number of Restaurants")
    )

  return(bar_graph)
}

#second_new_chart(data, 5, "pink")
