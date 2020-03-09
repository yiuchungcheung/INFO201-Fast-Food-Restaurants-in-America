library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(gridExtra)

data <- read.csv(
  file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
  stringsAsFactors = FALSE
)

fourth_chart <- function(data) {

  # bar chart - grouped by
  num_per_name_df <- data %>%
    group_by(name = tolower(name)) %>%
    summarize(count = n()) %>%
    top_n(10, count) %>%
    arrange(desc(count))



  # referenced from this site : https://plot.ly/r/pie-charts/
  pie_chart <- plot_ly(
    data = num_per_name_df, labels = ~name, values = ~count, type = "pie",
    textposition = "inside",
    textinfo = "label+percent",
    insidetextfont = list(color = "#FFFFFF"),
    hoverinfo = "text",
    text = ~ paste(count, " stores"),
    marker = list(
      colors = colors,
      line = list(color = "#FFFFFF", width = 1)
    ),
    showlegend = FALSE
  )

  pie_chart <- pie_chart %>% layout(
    title = "Top Ten Fast Food Restaurants",
    xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklables = FALSE),
    yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklables = FALSE)
  )

  return(pie_chart)
}

fourth_chart(data)
