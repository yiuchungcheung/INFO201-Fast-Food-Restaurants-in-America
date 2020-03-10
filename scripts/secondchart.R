library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(stringr)


data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv", stringsAsFactors = FALSE)

# second_chart <- function(data, number, colour_bar) {
#   total_fast_food_chains <- data %>%
#     group_by(province) %>%
#     summarise(total_num_restaurants = n()) %>%
#     top_n(number)
# 
#   bar_chart <- ggplot(data = total_fast_food_chains) +
#     geom_col(mapping = aes(x = province, y = total_num_restaurants, fill = colour_bar)) +
#     ggtitle("Total Number of Fast Food Restaurants per State ") +
#     labs(x = "State (Abr.)", y = "Total Number of Restaurants") +
#     theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 5))
# 
#   return(bar_chart)
# }

 # graph <- second_chart(data, 20, "blue")
 # print(graph)
# 
# #location as a parameter
# new_second_chart <- function(data, location, colour_bar) {
# 
#   bar_graph <- data %>%
#     group_by(location) %>%
#     summarise(total_num_restaurants = n()) %>%
# 
#     ggplot(aes(x = location, y = total_num_restaurants, fill = colour_bar)) +
#     geom_bar(stat = "identity") +
#     ggtitle("Total Number of Fast Food Restaurants") +
#     labs(x = location, y = "Total Number of Restaurants") +
#     theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 5))
# 
#   return(bar_graph)
# }
# 

second_new_chart <- function(df, number, colour_bar) {

  number <- as.numeric(as.character(number))
  
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

#second_new_chart(data, 25, "pink")
