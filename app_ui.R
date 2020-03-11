
# Introductory panel 
intro_panel <- 
  mainPanel(
    #includeHTML("intro_page.html")
    h1("United State's Fast Food Distribution Project", align = "center"),
    #img(src = "Cartoon_fast_food"),
    h3("Topic Inspiration"),
    HTML("<p> Info</p>
        <br>
        <p>Info</p>"
         
    )
  )

# Map of most popular fast food places
map_panel <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "map_variable",
      label = "Top Fast Food Restaurants Map Distribution",
      choices = list("Subway" = "subway", "Taco Bell" = "taco bell",
                     "McDonald's" = "mcdonald's", "Wendy's" = "wendys")
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
    label = "Top States for Fast Food",
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
    HTML("<p><center><b>The bar graph above provides the (abbreviated) state names with the highest concentration of 
          fast food chains within a Fast Food Distribution sample of 10,000 locations. The following is placed
          in alphabetical order.</b></center></p>
        <br>
        <p> Ohio State has the highest number of fast food chains from this data. It has
         a total of 922 locations. </p>"
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

# Summary panel
summary_panel <- 
  mainPanel()

ui <- tagList(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")),
  navbarPage(
    "U.S. Fast Food Distribution",
    tabPanel(
      "Introduction",
      intro_panel
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
    ),
    tabPanel(
      "Project Summary",
      summary_panel
      )
    )
  )

