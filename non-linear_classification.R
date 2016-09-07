## Non-Linear Classification

## Mixture Discriminant Analysis (MDA)
# load the package
library(mda)
data(iris)
# fit model
fit <- mda(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)


## Quadratic Discriminant Analysis (QDA)
## seeks a quadratic relationship between attributes that 
## maximises the distance between the classes.
# load the package
library(MASS)
data(iris)
# fit model
fit <- qda(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])$class
# summarize accuracy
table(predictions, iris$Species)


## Regularized Discriminant Analysis (RDA)
# load the package
library(klaR)
data(iris)
# fit model
fit <- rda(Species~., data=iris, gamma=0.05, lambda=0.01)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])$class
# summarize accuracy
table(predictions, iris$Species)


## Neural Network
## a graph of computational units that recieve inputs and 
## transfer the result into an output that is passed on. 
## The units are ordered into layers to connect the features of an input vector 
## to the features of an output vector. 
## With training, such as the Back-Propagation algorithm, 
## neural networks can be designed and trained to model the underlying relationship in data.
# load the package
library(nnet)
data(iris)
# fit model
fit <- nnet(Species~., data=iris, size=4, decay=0.0001, maxit=500)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)


## Flexible Disciminant Analysis (FDA)
# load the package
library(mda)
data(iris)
# fit model
fit <- fda(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)


## Support Vector Machine
## method that uses points in a transformed problem space 
## that best separate classes into two groups. 
## Classification for multiple classes is supported by a one-vs-all method. 
## SVM also supports regression by modeling the function with a minimum amount of 
## allowable error.
# load the package
library(kernlab)
data(iris)
# fit model
fit <- ksvm(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="response")
# summarize accuracy
table(predictions, iris$Species)


## k-Nearest Neighbours
## makes predictions by locating similar cases to a given data instance 
## (using a similarity function) and returning the average or majority of 
## the most similar data instances.
# load the package
library(caret)
data(iris)
# fit model
fit <- knn3(Species~., data=iris, k=5)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)


## Naive Bayes
## uses Bayes Theorem to model the conditional relationship 
## of each attribute to the class variable.
# load the package
library(e1071)
data(iris)
# fit model
fit <- naiveBayes(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)

