library(tidyverse)
library(caTools)

data <- read.csv("/home/kasian/workspace/projects/R/project/data/shopping_trends_updated.csv")

names_to_factorize <- c(3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17)

data[, names_to_factorize] <- lapply(data[, names_to_factorize], factor)

data <- data[, -c(1)]

set.seed(100)

split <- sample.split(data$Gender, SplitRatio = 0.6)
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

print(dim(train))
print(dim(test))

model_glm <- glm(Gender ~ ., family = "binomial", data = train)

predict_test <- predict(model_glm, newdata = test, type = "response")
confusion_matrix_test <- table(test$Gender, predict_test >= 0.5)

accuracy_test <- sum(diag(confusion_matrix_test)) / nrow(test)
print(accuracy_test)
