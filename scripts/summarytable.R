library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

summary_table <- function(data) {
  by_state <- data %>%
    mutate(isMcD = ifelse(name == "McDonald's" | name == "McDonalds", 1, 0)) %>%
    group_by(province) %>%
    summarise(n_fast_food = n(), n_mcd = sum(isMcD)) %>%
    select(province, n_fast_food, n_mcd)
  
  state_fast_food_places <- as.data.frame(by_state)
  return (state_fast_food_places)
}