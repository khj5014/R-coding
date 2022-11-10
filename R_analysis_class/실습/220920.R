z <- matrix(1:20, nrow=4, ncol=5)
z

z2 <- matrix(1:20, nrow=4, ncol=5,byrow = T)
z2

x <- 1:4
y <- 5:8
z <- matrix(1:20,nrow=4, ncol = 5)

m1 <- cbind(x,y)
m1
m2 <- rbind(x,y)
m2
m3 <- rbind(m2,x)
m3
m4 <- cbind(z,x)
m4

z <- matrix(1:20,nrow = 4,ncol = 5)
z

z[2,3]
z[1,4]
z[2,]
z[,4]

z <- matrix(1:20,nrow = 4,ncol = 5)
z

z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[,c(1,4)]

score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),nrow = 4, ncol = 3)
score
rownames(score) <- c('John','Tom','Mark','Jane')
colnames(score) <- c('English','Math','Science')
score

score['John','Math']
score['Tom',c('Math','Science')]
score['Mark',]
score[,"English"]
rownames(score)
colnames(score)
colnames(score)[2]

city <- c("Seoul","Tokyo","Washington")
rank <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info

iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.Length","Species")]
iris[1:5,]
iris[1:5,c(1,3)]

dim(iris)
nrow(iris)
ncol(iris)
colnames(iris)
head(iris)
tail(iris)
