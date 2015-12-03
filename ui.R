fluidPage(
  # Application title
  titlePanel("Word Cloud"),

  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("text", label = h3("Text input"), value = "text"),
      actionButton("update", "Change"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 250, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 200,  value = 100)
    ),
    mainPanel(
        plotOutput("plot")
    )
  )
  )
#)