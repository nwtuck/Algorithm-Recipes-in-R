## Non-Linear Decision Tree Regression 

## Classification and Regression Trees (CART)
## split attributes based on values that minimize a loss function, 
## such as sum of squared errors.
# load the package
library(rpart)
# load data
data(longley)
# fit model
fit <- rpart(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Conditional Decision Trees 
## created using statistical tests to select split points on attributes 
## rather than a loss function.
# load the package
library(party)
# load data
data(longley)
# fit model
fit <- ctree(Employed~., data=longley, controls=ctree_control(minsplit=2,minbucket=2,testtype="Univariate"))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Model Tree
## create a decision tree and use a linear model at each node 
## to make a prediction rather than using an average value.
## MP5 Model Tree: 
# load the package
library(RWeka)
library(partykit)  # require for plot(fit)
# load data
data(longley)
# fit model
fit <- M5P(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Rule System
## crated by extracting and simplifying the rules from a decision tree.
# load the package
library(RWeka)
# load data
data(longley)
# fit model
fit <- M5Rules(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Bagging (Bootstrapped Aggregation) CART
## ensemble method that creates multiple models of the same type 
## from different sub-samples of the same dataset. 
## The predictions from each separate model are combined together 
## to provide a superior result. This approach has shown participially effective 
## for high-variance methods such as decision trees.
## Bagging applied to recursive partitioning decision tree: 
# load the package
library(ipred)
# load data
data(longley)
# fit model
fit <- bagging(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Random Forest
## variation on Bagging of decision trees by reducing the attributes available 
## to making a tree at each decision point to a random sub-sample. 
## This further increases the variance of the trees and more trees are required.
# load the package
library(randomForest)
# load data
data(longley)
# fit model
fit <- randomForest(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Gradient Boosted Machine (Boosting)
## ensemble method developed for classification for reducing bias 
## where models are added to learn the misclassification errors in existing models. 
## It has been generalized and adapted in the form of Gradient Boosted Machines (GBM) 
## for use with CART decision trees for classification and regression.
# load the package
library(gbm)
# load data
data(longley)
# fit model
fit <- gbm(Employed~., data=longley, distribution="gaussian")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Cubist
## ensemble method constructed like model trees but involve a boosting-like procedure 
## called committees that re rule-like models.
# load the package
library(Cubist)
# load data
data(longley)
# fit model
fit <- cubist(longley[,1:6], longley[,7])
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)