## Non-Linear Regression

## Multivariate Adaptive Regression Splines
## non-parametric regression method that models multiple nonlinearities in data 
## using hinge functions (functions with a kink in them)
# load the package
library(earth)
# load data
data(longley)
# fit model
fit <- earth(Employed~., longley)
# summarize the fit
summary(fit)
# summarize the importance of input variables
evimp(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Support Vector Machine
## a class of methods, developed originally for classification, 
## that find support points that best separate classes. 
## SVM for regression is called Support Vector Regression (SVM).
# load the package
library(kernlab)
# load data
data(longley)
# fit model
fit <- ksvm(Employed~., longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## k-Nearest Neighbour (KNN)
## creates predictions from close data on-demand when a prediction is required. 
## A similarity measure (such as Euclidean distance) is used 
## to locate close data in order to make predictions.
# load the package
library(caret)
# load data
data(longley)
# fit model
fit <- knnreg(longley[,1:6], longley[,7], k=3)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


## Neural Network
## graph of computational units that recieve inputs and 
## transfer the result into an output that is passed on. 
## The units are ordered into layers to connect the features 
## of an input vector to the features of an output vector. 
## With training, such as the Back-Propagation algorithm, neural networks 
##can be designed and trained to model the underlying relationship in data.
# load the package
library(nnet)
# load data
data(longley)
x <- longley[,1:6]
y <- longley[,7]
# fit model
fit <- nnet(Employed~., longley, size=12, maxit=500, linout=T, decay=0.01)
# summarize the fit
summary(fit)

# make predictions
predictions <- predict(fit, x, type="raw")
# summarize accuracy
rmse <- mean((y - predictions)^2)
print(rmse)


