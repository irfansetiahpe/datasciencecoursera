Developing Data Products Course Project
========================================================
author: 
date: February 8, 2017
autosize: true

Background
========================================================

- This presentation is part of Coursera's Developing Data Products Course Project
- The project contains shiny app creation for Iris Species Prediction using R dataset
- Shiny app is deployed here: https://avalondigo.shinyapps.io/irisPrediction/
- Source code is uploaded to GitHub: https://github.com/irfansetiahpe/dsc/tree/master/irisPrediction

Shiny Application Details
========================================================

- Uses iris dataset on R
- Trains prediction model using Random Forest method
- Retrieves input as test data from user
- Displays output of predicted species and Random Forest plot


```r
summary(iris)
```

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
                
```

Shiny Application Prediction Training
========================================================


```r
library(caret)

# reading data
data(iris)

# use all data for training
inTrain <- createDataPartition(y=iris$Species, p = 1, list=FALSE)
training <- iris[inTrain,]

# instruct train to use 3-fold CV to select optimal tuning parameters
fitControl <- trainControl(method="cv", number=3, verboseIter=F)

# generate random forest
fit <- train(Species ~ ., data=training, method="rf", trControl=fitControl)
```

Thank you
========================================================
