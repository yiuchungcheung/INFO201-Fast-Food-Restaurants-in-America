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

fourth_chart <- function(data, top_n_rest) {

  top_n_rest <- as.numeric(top_n_rest)
  
  # bar chart - grouped by
  num_per_name_df <- data %>%
    group_by(name = tolower(name)) %>%
    summarize(count = n()) %>%
    top_n(top_n_rest, count) %>%
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

  top_title <- paste0("Top ", top_n_rest, " Fast Food Restaurants")
  pie_chart <- pie_chart %>% layout(
    title = top_title,
    xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklables = FALSE),
    yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklables = FALSE)
  )

  return(pie_chart)
}
