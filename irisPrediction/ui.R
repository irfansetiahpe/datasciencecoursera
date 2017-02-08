#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Iris Species Prediction"),  
    sidebarPanel(
      h3('User Input'),
      numericInput('sepalLength', strong('Sepal.Length (cm)'), 5.1, min = 4.3, max = 7.9, step = 0.1),
      numericInput('sepalWidth', strong('Sepal.Width (cm)'), 3.5, min = 2, max = 4.4, step = 0.1),
      numericInput('petalLength', strong('Petal.Length (cm)'), 1.4, min = 1, max = 6.9, step = 0.1),
      numericInput('petalWidth', strong('Petal.Width (cm)'), 0.2, min = 0.1, max = 2.5, step = 0.1),
      submitButton('Submit')
    ),
    mainPanel(
      h4('This tool is able to predict iris species based on the measurements in centimeters of the variables sepal length and width and petal length and width for 3 different species: sentosa, versicolor, and virginica.'),
      h3('Predicted Species:'),
      textOutput("predictedSpecies"),
      h3('Random Forest Plot:'),
      plotOutput('rfPlot')
    )
  )
)