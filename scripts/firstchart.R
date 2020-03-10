library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

first_chart <- function(input_data, variable, color) {

   new_data <- data %>%
     group_by(name = tolower(name)) %>%
     filter(name == variable)

  map <- leaflet(data = new_data) %>%
    addTiles() %>%
    addCircleMarkers(
      lat = ~new_data$latitude,
      lng = ~new_data$longitude,
      radius = 0.005,
      popup = paste(
        "Name:", new_data$name, "<br>",
        "City:", new_data$city, "<br>",
        "Address:", new_data$address, "<br>",
        "State:", new_data$province, "<br>"
      ),
      color = ~color
    )
  return(map)
}
