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

#mapview(bike, xcol = "start_lat", ycol = "start_lng", crs = 4269, grid = FALSE)

#ggplot(bike, aes(x=as.factor(rideable_type), fill=as.factor(rideable_type) )) + 
#  geom_bar( ) +
#  scale_fill_hue(c = 40) +
#  theme(legend.position="none")    

#ggplot(bike, aes(x=as.factor(start_station_name), fill=as.factor(start_station_name) )) + 
#  geom_bar( ) +
#  scale_fill_hue(c = 40) +
#  theme(legend.position="none")  

#ggplot(bike, aes(x=as.factor(end_station_name), fill=as.factor(end_station_name) )) + 
#  geom_bar( ) +
#  scale_fill_hue(c = 40) +
#  theme(legend.position="none")

#head(bike)


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