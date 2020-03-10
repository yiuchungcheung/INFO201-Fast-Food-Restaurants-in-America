
# Introductory panel (?)
tab_1 <- 
  sidebarLayout(
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
    h2("Map of Most Widespread Food Chains", align = "center"),
    leafletOutput("first_chart"),
    HTML("<p>Insignt or description of the graph here.</p>
        <br>
        <p> More insights here </p>"
    )
  )
)
# Bar graph with top numbers of fast food locations 

bar_graph_panel <- sidebarLayout(
sidebarPanel(
  selectInput(
    inputId = "number",
    label = "Top Number of States",
    choices = list("Top 10" = 10, "Top 15" = 15,
                   "Top 20" = 20)
    
  ),
    radioButtons(
      inputId = "colour_bar",
      label = h3("Change Bar Colour"),
      choices = list("Pink" = "pink", "Blue" = "blue", 
                     "Purple" = "purple"),
    )
  ),
  mainPanel(
    h2("States with Top Number of Fast Food Chains", align = "center"),
    plotlyOutput(outputId = "second_chart"),
    HTML("<p>The bar graph above provides the (abbreviated) state names with the highest concentration of 
          fast food chains within a Fast Food Distribution sample of 10,000 locations. The following is placed
          in alphabetical order.</p>
        <br>
        <p> More insights here </p>"
    )
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
    h2("[Insert Pie Chart Title Here]", align = "center"),
    plotOutput(outputId = "third_chart"),
    HTML("<p>Insignt or description of the graph here.</p>
        <br>
        <p> More insights here </p>"
    )
  )
)

ui <- tagList(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")),
  navbarPage(
    "U.S. Fast Food Distribution",
    tabPanel(
      "TAB 1",
      titlePanel("Insert Info"),
      tab_1
    ),
    tabPanel(
      "Geographic Map Analysis",
      map_panel
    ),
    tabPanel(
      "Bar Graph Analysis",
      bar_graph_panel
    ),
    tabPanel(
      "Pie Chart Analysis",
      pie_chart_panel
      
      
    )
  )
)

