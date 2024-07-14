library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Hello World Shiny App"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

# Run the application 
print("here")
rJava::.jinit()
v <- rJava::.jcall("java/lang/System", "S", "getProperty", "java.version")
print(v)

#Generated with OhdsiShinyModules v2.1.4 and ShinyAppBuilder v2.0.1
#×
#Error loading module: Error in rJava::.jcall("java/lang/System", "S", "getProperty", "java.version"): RcallMethod: cannot determine object class
shinyApp(ui = ui, server = server)