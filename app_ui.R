

tab_1 <- sidebarLayout(
  sidebarPanel(
    
  ),
  mainPanel(
  )
)

tab_2 <- sidebarLayout(
  sidebarPanel(
  ),
  mainPanel(
  )
)
tab_3 <- sidebarLayout(
  sidebarPanel(
  ),
  mainPanel(
  )
)

ui <- navbarPage("Fast Food",
                 tabPanel("TAB 1",
                          titlePanel("Another title here"),
                          tab_1),
                 tabPanel("TAB 2",
                          titlePanel("Another title her"),
                          tab_2),
                 tabPanel("TAB 3",
                          titlePanel("Another title her"),
                          tab_3)
)