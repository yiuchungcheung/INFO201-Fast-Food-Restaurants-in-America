library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv", stringsAsFactors = FALSE)

by_state <- data %>%
  group_by(province) %>%
  summarise(n_fast_food = n()) %>%
  select(province, n_fast_food)

state_fast_food_places <- as.data.frame(by_state)