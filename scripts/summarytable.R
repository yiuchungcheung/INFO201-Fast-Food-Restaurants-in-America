library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
  stringsAsFactors = FALSE)

summary_table <- function(data) {
  by_state <- data %>%
    mutate(isMcD = ifelse(name == "McDonald's" |
      name == "McDonalds", 1, 0)) %>%
    group_by(province) %>%
    summarise(
      n_fast_food = n(), n_mcd = sum(isMcD),
      n_mcd_proportion = paste0(
        round((n_mcd / n_fast_food) * 100),
        "%"
      )
    ) %>%
    select(province, n_fast_food, n_mcd, n_mcd_proportion)

  state_fast_food_places <- as.data.frame(by_state)
  return(state_fast_food_places)
}
