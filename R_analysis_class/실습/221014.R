#두줄그래프
month = 1:12
late1 <- c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)
late2 <- c(4, 6, 5, 8, 7, 8, 10, 11, 6, 5, 7, 3)
plot(
  month,
  late1,
  main = "지각 학생",
  type = "b",
  lty = 1,
  col = "red",
  xlab = "Month",
  ylab = "Late cnt",
  ylim = c(1, 15)
)
lines(month,
      late2,
      type = "b",
      col = "blue")


install.packages("mlbench")
library(mlbench)

data("BostonHousing")
myds <- BostonHousing[, c("crim", "rm", "dis", "tax", "medv")]
grp <- c()
for (i in 1:nrow(myds)) {
  if (myds$medv[i] >= 25.0) {
    grp[i] <- "H"
  } else if (myds$medv[i] <= 17.0) {
    grp[i] <- "L"
  } else{
    grp[i] <- "M"
  }
}
grp <- factor(grp)
grp <- factor(grp, levels = c("H", "M", "L"))
myds <- data.frame(myds, grp)

str(myds)
head(myds)

table(myds$grp)

par(mfrow = c(2, 3))
for (i in 1:5) {
  hist(myds[, i], main = colnames(myds)[i], col = 2:7)
}
par(mfrow = c(1, 1))

par(mfrow = c(2, 3))
for (i in 1:5) {
  boxplot(myds[, i], main = colnames(myds)[i])
}
par(mfrow = c(1, 1))

boxplot(myds$crim ~ myds$grp, main = "1인당 범죄율")
boxplot(myds$rm ~ myds$grp, main = "방의 개수")

pairs(myds[, -6])

point <- as.integer(myds$grp)
color <- c("red", "green", "blue")
pairs(myds[, -6], pch = point, col=color[point])

#상관계수
cor(myds[,-6])

#7장 데이터 전처리
z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)
sum(is.na(z))
sum(z, na.rm=TRUE)

z1 <- c(1,2,3,NA,5,NA,8)
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z1)] <- 0
z1

z3 <- as.vector(na.omit(z2))
z3

x <- iris
x[1,2] <- NA; x[1,3] <- NA
x[2,3] <- NA; x[3,4] <- NA
head(x)

for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i])
  cat(colnames(x)[i],"\t", sum(this.na),"\n" )
}

col_na <- function(y){
  return(sum(is.na(y)))
}

na_count <- apply(x, 2, FUN=col_na)
na_count
