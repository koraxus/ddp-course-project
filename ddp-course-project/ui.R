#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The predicted stopping distance of a 1920's motor vehicle"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderSpeed",
                   "What is the speed of the car (mph)?",
                    min = 4,
                    max = 150,
                    value = 15),
       checkboxInput("showModel1","Show/Hide Model 1",value=TRUE)
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Stopping distance in ft from Model 1:"),
       textOutput("pred1")
       
    )
  )
))
