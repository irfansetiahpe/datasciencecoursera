library(shiny)
library(caret)
library(rattle)

data(iris)
inTrain <- createDataPartition(y=iris$Species, p = 1, list=FALSE)
training <- iris[inTrain,]
# instruct train to use 3-fold CV to select optimal tuning parameters
fitControl <- trainControl(method="cv", number=3, verboseIter=F)
fit <- train(Species ~ ., data=training, method="rf", trControl=fitControl)

shinyServer(
  function(input, output) {
    output$predictedSpecies <- renderText({
      userInput <- data.frame(input$sepalLength,input$sepalWidth,input$petalLength,input$petalWidth)
      names(userInput)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
      levels(iris$Species)[predict(fit,newdata=userInput)]
    })
    output$rfPlot <- renderPlot({          
      plot(fit$finalModel)                                       
    })
  }
)
