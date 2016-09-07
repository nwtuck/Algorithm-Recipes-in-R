## Non-Linear Decision Tree Classification

## Classification and Regression Tree (CART)
## split attributes based on values that minimize a loss function, 
## such as sum of squared errors.
# load the package
library(rpart)
# load data
data(iris)
# fit model
fit <- rpart(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)


## C4.5
## an extension of the ID3 algorithm and constructs a decision tree 
## to maximize information gain (difference in entropy).
# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- J48(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)


## PART
## a rule system that creates pruned C4.5 decision trees for the data set 
## and extracts rules and those instances that are covered by the rules 
## are removed from the training data. 
## The process is repeated until all instances are covered by extracted rules.
# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- PART(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)


## Bagging CART
## an ensemble method that creates multiple models of the same type 
## from different sub-samples of the same dataset. 
## The predictions from each separate model are combined together 
## to provide a superior result. 
## This approach has shown participially effective for high-variance methods 
## such as decision trees.
# load the package
library(ipred)
# load data
data(iris)
# fit model
fit <- bagging(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)


## Random Forest
## variation on Bagging of decision trees by reducing the attributes 
## available to making a tree at each decision point to a random sub-sample. 
## This further increases the variance of the trees and more trees are required.
# load the package
library(randomForest)
# load data
data(iris)
# fit model
fit <- randomForest(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)


## Gradient Boosted Machine (GBM)
## an ensemble method developed for classification for reducing bias 
## where models are added to learn the misclassification errors in existing models. 
## It has been generalized and adapted in the form of Gradient Boosted Machines (GBM) 
## for use with CART decision trees for classification and regression.
# load the package
library(gbm)
# load data
data(iris)
# fit model
fit <- gbm(Species~., data=iris, distribution="multinomial")
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)


## Boosted C5.0
## a further extension of C4.5 and pinnacle of that line of methods. 
## It was proprietary for a long time, although the code was released recently 
## and is available in the C50 package.
# load the package
library(C50)
# load data
data(iris)
# fit model
fit <- C5.0(Species~., data=iris, trials=10)
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)

