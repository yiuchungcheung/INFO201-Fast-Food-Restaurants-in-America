

tab_1 <- sidebarLayout(
  sidebarPanel(),
  mainPanel()
)

# Map of most popular fast food places
map_panel <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "map_variable",
      label = "Top Fast Food Restaurants Map Distribution",
      choices = list("Subway" = "subway", "Taco Bell" = "taco bell", "McDonald's" = "mcdonald's")
    ),
    radioButtons(
      inputId = "vis_1",
      label = h3("Pick a color"),
      choices = list("Grey" = "grey", "Red" = "red", "Blue" = "blue"),
      selected = "grey"
    )
  ),
  mainPanel(
    leafletOutput("first_chart")
  )
)
# Bar graph of States with most fast food places 
# Numbers are not in data set so it doesn't work 

bar_graph_panel <- sidebarLayout(
sidebarPanel(
  selectInput(
    inputId = "number",
    label = "Top Number of States",
    choices = list("Top 5" = 5, "Top 10" = 10,
                   "Top 15" = 15)
    
  ),
    radioButtons(
      inputId = "colour_bar",
      label = h3("Change Bar Colour"),
      choices = list("Pink" = "pink", "Yellow" = "yellow"),
    )
  ),
  mainPanel(
    plotOutput(outputId = "second_chart")
  )
)

# Pie chart of top chains (percentage breakdown)
pie_chart_panel <- sidebarLayout(
  sidebarPanel(
    radioButtons(
      inputId = "vis_3",
      label = h3("Pick a color or something- change this"),
      choices = list("Grey" = "grey", "Red" = "red"),
      selected = "grey"
    ),
    radioButtons(
      inputId = "vis_3_data",
      label = h3("Change another aspect"),
      choices = list("Grey" = "grey", "Red" = "red"),
      selected = "grey"
    )
  ),
  mainPanel(
    plotOutput(outputId = "third_chart")
  )
)

ui <- navbarPage(
  "U.S. Fast Food Distribution",
   tabPanel(
    "TAB 1",
    titlePanel("Insert Info"),
    tab_1
  ),
  tabPanel(
    "Geographic Map Analysis",
    titlePanel("Map of Most Widespread Food Chains"),
    map_panel
  ),
  tabPanel(
    "Bar Graph Analysis",
    titlePanel("Visualization 2"),
    bar_graph_panel
  ),
  tabPanel(
    "Pie Chart Analysis",
    titlePanel("Visualization 3"),
    pie_chart_panel
  )
)
