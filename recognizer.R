library(MASS)
library(class)
library(e1071)

# set working directory
setwd("/Users/neel/Documents/Columbia/Kaggle/Digit\ Recognizer")

# read test and train
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# sort the data
train <- train[order(train$label),]

# true classification
cl = train[, 1]
train.data <- train[,-1]
model <- svm(train.data, cl, type = "C", kernel = "radial", cost = 1, gamma = 1)


ImageId = 1:28000

testcl <- data.frame(ImageId, label)

# write class labels
write.csv(testcl, "testcl.csv", row.names = FALSE, na = "")
