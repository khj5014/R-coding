iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new)
summary(mod.iris) 


unknown <- data.frame(rbind(c(5.1 ,3.5,1.4,0.2)))
names(unknown) <- names(iris)[1:4]
unknown

pred <- predict(mod.iris, unknown)
pred
round(pred,0)

pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]

test <- iris[,1:4]
pred <- predict(mod.iris, test)
pred <- round(pred,0)
pred

answer <- as.integer(iris$Species)
pred == answer
acc <- mean(pred == answer)
acc

mydata <- iris[,1:4]

fit <- kmeans(x=mydata,centers = 3)
fit
fit$cluster
fit$centers

library(cluster)
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE,
         labels = 2, lines = 0)
subset(mydata, fit$cluster==2)

std <- function(X) { # 표준화 함수
  return((X-min(X)) /(max(X)-min(X)))
  
}
mydata <- apply(iris[,1:4],2,std)
fit <- kmeans(x=mydata,centers = 3)
fit

