library(dplyr)
library(lintr)
library(styler)
library(tidyr)
library(leaflet)
library(ggplot2)
library(plotly)
library(gridExtra)

#data <- read.csv(file = "data/Datafiniti_Fast_Food_Restaurants_May19.csv",
#                 stringsAsFactors = FALSE)

fourth_chart <- function(data) {

# bar chart - grouped by 
num_per_name_df <- data %>%
  group_by(name = tolower(name)) %>%
  summarize(count = n()) %>%
  top_n(10, count) %>%
  arrange(desc(count))

# create the bar chart
bar_chart <- ggplot(data = num_per_name_df) +
  geom_col(mapping = aes(x = name, y = count)) +
  ggtitle("Top Ten Fast Food Restaurants") +
  labs(x = "Name", y ="Number of Restaurants") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 5))

bar_chart <- ggplotly(bar_chart)

return(bar_chart)

}

