## Linear Classification 

## Logistic Regression 
## classification method that models the probability of an observation belonging 
## to one of two classes. As such, normally logistic regression is demonstrated 
## with binary classification problem (2 classes). 
## Logistic Regression can also be used on problems with more than two classes (multinomial)
# load the package
library(VGAM)
# load data
data(iris)
# fit model
fit <- vglm(Species~., family=multinomial, data=iris)
# summarize the fit
summary(fit)
# make predictions
probabilities <- predict(fit, iris[,1:4], type="response")
predictions <- apply(probabilities, 1, which.max)
predictions[which(predictions=="1")] <- levels(iris$Species)[1]
predictions[which(predictions=="2")] <- levels(iris$Species)[2]
predictions[which(predictions=="3")] <- levels(iris$Species)[3]
# summarize accuracy
table(predictions, iris$Species)


## Linear Discriminant Analysis (LDA)
## classification method that finds a linear combination of data attributes 
## that best separate the data into classes.
# load the package
library(MASS)
data(iris)
# fit model
fit <- lda(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])$class
# summarize accuracy
table(predictions, iris$Species)


## Partial Least Squares Disciminant Analysis
## application of LDA on a dimension-reducing projection of 
## the input data (partial least squares).
# load the package
library(caret)
library(klaR)
data(iris)
x <- iris[,1:4]
y <- iris[,5]
# fit model
fit <- plsda(x, y, probMethod="Bayes")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)

