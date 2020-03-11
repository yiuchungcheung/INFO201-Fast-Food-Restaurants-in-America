library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)

source("./scripts/firstchart.R")
source("./scripts/secondchart.R")
source("./scripts/fourthchart.R")
source("./scripts/thirdchart.R")

server <- function(input, output) {
  data <- read.csv(
    file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
    stringsAsFactors = FALSE
  )

  # ----------------- Visualization 1 --------------------
  output$first_chart <- renderLeaflet({
    return(first_chart(data, input$map_variable, input$vis_1))
  })


  # -----------------Visualization 2 --------------------

  output$second_chart <- renderPlotly({
    return(second_new_chart(data, input$number, input$colour_bar))
  })


  # -------------------Visualization 3 ------------------

  output$third_chart <- renderPlotly({
    if (input$show_other) {
      return(third_chart(data, input$top_restaurants))
    }
    return(fourth_chart(data, input$top_restaurants))
  })
}
