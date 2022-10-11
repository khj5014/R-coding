str(iris)
iris[,5]
unique(iris[,5])
table(iris[,"Species"])

colSums(iris[,-5])
colMeans(iris[,-5])

rowSums(iris[,-5])
rowMeans(iris[,-5])

z <- matrix(1:20, nrow = 4, ncol = 5)
z
t(z)

IR.1 <- subset(iris, Species=="setosa")
IR.1

IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)
IR.2
IR.2[,c(2,4)]

a <- matrix(1:20,4,5)
b <- matrix(21:40,4,5)
a
b

2*a

b-5
2*a + 3*b

a+b
b-a
b/a
a*b

a <- a*3
b <- b-5

a
b

st <- data.frame(state.x77)
head(st)
class(st)

iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)

iris[,"Species"]
iris[,5]
iris["Species"]
iris[5]
iris$Species

setwd("C:/Users/pc/Desktop")
air <- read.csv("airquality.csv", header = T)
head(air)

my.iris <- subset(iris, Species == 'setosa')
write.csv(my.iris, "my_iris.csv", row.names=F)

job.type <- 'A'
if(job.type == 'B'){
  bonus <- 200
}else{
  bonus <- 100
}
print(bonus)


job.type <- 'B'
bonus <- 100
if(job.type=='A'){
  bonus <- 200
}
print(bonus)

a <- 10
b <- 20
if(a>5 & b>5){
  print(a+b)
}

if(a>5 | b>30){
  print(a*b)
}

a <- 10
b <- 20

if(a>b){
  c <- a
}else{
  c <- b
}
print(c)

a <-10
b <-20

c <- ifelse(a>b,a,b)
print(c)

for (i in 1:5) {
  print('*')
  
}

for(i in 1:9){
  cat('2 *',i,'=',2*i,'\n')
}
