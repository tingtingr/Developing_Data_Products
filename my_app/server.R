library(shiny)

activity <- read.csv('Advertising.csv')

function(input, output) {
  
  output$distPlot <- renderPlot({
    x    <- activity[, input$dataset]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',xlab=input$dataset, main = paste("Histogram of ",input$dataset))
  })
  
  output$regPlot <- renderPlot({
    x    <- activity[, input$dataset]
    y <- activity[, 'Sales']
    plot(x,y,col='blue',xlab = input$dataset, ylab = 'Sales', main = paste('Scatterplot of ', input$dataset, " VS Sales"))
    abline(lm(y~x), col="red", lwd=2)
  })
}