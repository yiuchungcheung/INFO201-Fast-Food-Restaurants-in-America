

tab_1 <- sidebarLayout(
  sidebarPanel(),
  mainPanel()
)

# map
tab_2 <- sidebarLayout(
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
tab_3 <- sidebarLayout(
  sidebarPanel(
    radioButtons(
      inputId = "vis_2",
      label = h3("Pick a color or something- change this"),
      choices = list("Grey" = "grey", "Red" = "red"),
      selected = "grey"
    )
  ),
  mainPanel(
    plotOutput(outputId = "second_chart")
  )
)

tab_4 <- sidebarLayout(
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
  "Fast Food",
  tabPanel(
    "TAB 1",
    titlePanel("This is the Main Page"),
    tab_1
  ),
  tabPanel(
    "TAB 2",
    titlePanel("Visualization 1"),
    tab_2
  ),
  tabPanel(
    "TAB 3",
    titlePanel("Visualization 2"),
    tab_3
  ),
  tabPanel(
    "TAB 4",
    titlePanel("Visualization 3"),
    tab_4
  )
)
