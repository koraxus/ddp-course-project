#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  #mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20 , 0)   
  model1 <- lm(dist ~ speed, data = cars)
  #model2<-lm(hp ~ mpgsp + mpg, data = mtcars)
  
  model1pred <- reactive({
    speedInput <- input$sliderSpeed
    predict(model1, newdata = data.frame(speed = speedInput))
  })
  
  output$plot1 <- renderPlot({
    speedInput <- input$sliderSpeed
    
    plot(cars$speed, mtcars$dist, xlab = "Speed (mph)",
         ylab= "Stopping Distance (ft)", bty="n", pch=16,
         xlim =  c(10, 150), ylim = c(50,1000))
    if(input$showModel1) {
      abline(model1, col="red", lwd=2)
    }
    
    legend(20,400, c("Model 1 Prediction"), pch =16,
                     col= c("red"), bty = "n", cex=1.2)
    points(speedInput, model1pred(), col="red", pch=16, cex=2)
    abline(v=88, col="blue", lwd=3)
    
  })
  
  output$pred1 <- renderText({
    model1pred()
  })

})
