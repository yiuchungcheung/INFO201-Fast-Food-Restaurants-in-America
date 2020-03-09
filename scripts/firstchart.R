library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

data <- read.csv(
  file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
  stringsAsFactors = FALSE
)

# old first chart without interactions

# first_chart <- function(data) {
#   # interactive map
#   map <- leaflet(data = data) %>%
#     addTiles() %>%
#     addCircleMarkers(
#       lat = ~latitude,
#       lng = ~longitude,
#       radius = 0.005,
#       popup = paste(
#         "Name:", data$name, "<br>",
#         "City:", data$city, "<br>",
#         "Address:", data$address, "<br>",
#         "State:", data$province, "<br>",
#         "Category:", data$categories, "<br>"
#       )
#     )
#   return(map)
# }

first_chart <- function(data, variable, color) {
  new_name <- paste(variable)

  new_data <- data %>%
    group_by(name = tolower(name)) %>%
    filter(name == variable)

  map <- leaflet(data = new_data) %>%
    addTiles() %>%
    addCircleMarkers(
      lat = ~latitude,
      lng = ~longitude,
      radius = 0.005,
      popup = paste(
        "City:", data$city, "<br>",
        "Address:", data$address, "<br>",
        "State:", data$province, "<br>"
      ),
      color = ~color
    )
  return(map)
}
