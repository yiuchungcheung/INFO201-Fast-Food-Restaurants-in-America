library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)



# data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
#                 stringsAsFactors = FALSE)

second_chart <- function(data) {
  total_fast_food_chains <- data %>%
    group_by(province) %>%
    summarise(total_num_restaurants = n())

  bar_chart <- ggplot(data = total_fast_food_chains) +
    geom_col(mapping = aes(x = province, y = total_num_restaurants)) +
    # ggtitle("Total Number of Fast Food Restaurants per State ") +
    labs(x = "State (Abr.)", y = "Total Number of Restaurants") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 5))

  bar_chart <- ggplotly(bar_chart)

  return(bar_chart)
}
