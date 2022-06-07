library(neuralnet)

#데이터
data <- iris
#결측
na <- apply(data,2,is.na)
apply(na, 2, sum)

#정규화
maxs <- apply(data[,1:4], 2,max)

mins <- apply(data[,1:4], 2, min)

data[,1:4] <- scale(data[,1:4],center = mins,scale = maxs-mins)

#출력 데이터 생성
data$setosa <- ifelse(data$Species =="setosa",1,0)
data$virginica <- ifelse(data$Species =="virginica",1,0)
data$versicolor <- ifelse(data$Species =="versicolor",1,0)

head(data)

#학습용과 테스트용 데이터 분리
n <- nrow(data)

set.seed(2000)
index <- sample(1:n, round(0.8*n))

train <- as.data.frame(data[index,])
head(train)

test <- as.data.frame(data[-index,])
head(test)

f.var.independent <- "Sepal.Length + Sepal.Width + Petal.Length + Petal.Width"
f.var.dependent <- "setosa + versicolor + virginica"

f <- paste(f.var.dependent,"~",f.var.independent)

nn <- neuralnet(f,data = train,hidden = c(6,6),linear.output = F)
plot(nn)


predicted <- compute(nn, test[,-5:-8])

