# 1
# (1)
sum1 <- 0
num1  <- 0
for (i in 2:99) {
  if (i %% 3 == 0) {
    sum1 <- sum1 + i
    num1 <- num1 + 1
  }
}
print(sum1)
print(num1)
#--------------------------------------------------
# (2)
num2  <- 0
for (i in 102:199) {
  if ((i %% 3 == 0) & (i %% 4 == 0)) {
    print(i)
  }
}
#--------------------------------------------------
# (3)
num3 <- 24
i <- 1
for (i in i:num3) {
  if (num3 %% i == 0) {
    print(num3 / i)
    i + 1
  }
}
#--------------------------------------------------
# (4)
num4 <- 1
for (i in 1:10) {
  num4 <- num4 * i
}
#--------------------------------------------------
# 2
for (i in 1:9) {
  cat('9 *', i, '=', 9 * i, '\n')
}
#--------------------------------------------------
# 3
i <- 1
while (i <= 9) {
  cat('8 *', i, '=', 8 * i, '\n')
  i <- i + 1
}
#--------------------------------------------------
# 4
for (i in 2:99) {
  if (i %% 3 == 0) {
    cat(' *')
  } else
    cat('', i)
}
#--------------------------------------------------
# 5
primeN <- function(x) {
  i <- 2
  while (i < x) {
    if (x %% i == 0)
      return(FALSE)
    i <- i + 1
  }
  return(TRUE)
}
for (i in 3:999) {
  if (primeN(i)) {
    cat(i, '')
  }
}
#--------------------------------------------------
#6
fiv<- function(x){
  fivo<-c(0,1)
  for(i in 1:x){
    fivo[i+2]<-fivo[i]+fivo[i+1]
  }
  return(fivo[1:x])
}
fiv(40)
#--------------------------------------------------
#7
#(1)
apply(iris[-5],1,sum)
#(2)
apply(iris[-5],2,max)
#--------------------------------------------------
#8
# (1)
apply(mtcars,2,sum)
# (2)
apply(mtcars,2,max)
# (3)
apply(mtcars,2,sd)
#--------------------------------------------------
#9
#(1)
lgm <- function(x,y){
  max_div <- 1
  for(i in 2:min(x,y)){
    if((x%% i==0) & (y%%i==0)){
      max_div=i
    }
  }
  return (max_div)
}
lgm(10,20)
#--------------------------------------------------
#10
#(1)
maxmin <-function(x){
  this.max <- max(x)
  this.min <- min(x)
  return(list(max=this.max,min=this.min))
}
v1 <- c(7,1,2,8,9)
result<- maxmin(v1)
result$max
result$min
result<-maxmin(iris[,1])
result$max
result$min
#--------------------------------------------------
#11 
weight <- c(69,50,55,71,89,64,59,70,71,80)
#(1)
which.max(weight)
#(2)
which.min(weight)
#(3)
which(weight>=61&&weight<=69)
#(4)
idx<-which(weight<=60)
idx
weight.2 <- weight[idx]
weight.2
#--------------------------------------------------
#12
#(1)
iris[which.max(iris$Petal.Length),]
#(2)
iris[which(0.3<=iris$Petal.Width& iris$Petal.Width<=0.4),]