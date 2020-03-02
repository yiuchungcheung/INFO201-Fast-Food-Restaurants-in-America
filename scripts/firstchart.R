library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv", stringsAsFactors = FALSE)

# interactive map 
map <- leaflet(data = data) %>%
  addTiles() %>%
  addCircleMarkers(
    lat = ~latitude,
    lng = ~longitude,
    radius = 0.005, 
    popup = paste(
      "Name:", data$name, "<br>",
      "City:", data$city, "<br>",
      "Address:", data$address, "<br>",
      "State:", data$province, "<br>",
      "Category:", data$categories, "<br>"
    )
  )

