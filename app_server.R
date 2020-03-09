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

server <- function(input, output) {
  data <- read.csv(
    file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
    stringsAsFactors = FALSE
  )

  # ----------------- Visualization  --------------------
  output$first_chart <- renderLeaflet({
    return(first_chart(data, input$map_variable, input$vis_1))
  })


  # -----------------Visualization 2 --------------------

  output$second_chart <- renderPlot({
    return(second_chart(data))
  })


  # -------------------Visualization 3 ------------------

  output$third_chart <- renderPlotly({
    return(fourth_chart(data))
  })
}
