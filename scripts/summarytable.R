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

by_mcd <- data %>%
  filter(name == "McDonald's" || name == "McDonalds") %>%
  group_by(province) %>%
  summarise(num_mcd = n()) %>%
  select(province, num_mcd)

by_state_r <- data %>%
  group_by(province) %>%
  summarise(n_fast_food = n(), num_mcd = n(name == "McDonald's")) %>%
  select(province, n_fast_food, num_mcd)

most_pop_rest <- data %>%
  group_by(name) %>%
  summarise(num_rest = n()) %>%
  top_n(3, wt = num_rest) %>%
  select(name)

state_fast_food_places <- as.data.frame(by_state)
