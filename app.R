library(shiny)
library(dplyr)
require(readr)
library(geosphere)
library(ggplot2)

bike <- read.csv("https://raw.githubusercontent.com/sergiocast1/reto-sergio-castrillo/master/citibike-tripdata.csv")

bike <- bike %>%
  mutate(time= difftime(ended_at, started_at, units = "mins"))

ui <- fluidPage(
  titlePanel("Bike Data Shiny"),
  sidebarLayout(
    sidebarPanel(
      # inputs
    ),  
    
    mainPanel(
      # outputs
      plotOutput("bikeplot")
      
    ) 
  ) 
  )

#bike <- bike %>%
#  mutate(distancia= distm(x = bike[, c('start_lng', 'start_lat')], 
#                          y = bike[, c('end_lng', 'end_lat')],
#                          fun = distHaversine))


# Define server logic required to draw a scatterplot
server <- function(input, output) {
  output$bikeplot <- renderPlot({
    ggplot(bike, aes(x=as.factor(rideable_type), fill=as.factor(rideable_type) )) +
      geom_bar() + 
      scale_fill_hue(c = 40) +
      theme(legend.position="none")+
      xlab("Cantidad") +
      ylab("Tipo Bici") +
      ggtitle("Tipos de Bicis")
  })                                                
}
# Run the application 
shinyApp(ui = ui, server = server)