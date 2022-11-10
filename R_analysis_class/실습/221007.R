mydata <- c(60, 62, 64, 65, 68, 69, 120)
quantile(mydata)
quantile(mydata, (0:10) / 10)
summary(mydata)

var(mydata)
sd(mydata)
range(mydata)
diff(range(mydata))

dist <- cars[, 2]
hist(
  dist,
  main = "Histogram for 제동거리",
  xlab = "제동거리",
  ylab = "빈도수",
  border = "blue",
  col = "green",
  las = 2,
  breaks = 5
)

boxplot(dist,
        main = "자동차 제동거리",
        notch = TRUE,
        horizontal = TRUE)
boxplot.stats(dist)

par(mfrow = c(1, 3))
barplot(
  table(mtcars$carb),
  main = "Barplot of Carburetors",
  xlab = "#of Carburetors",
  ylab = "frequency",
  col = "blue"
)
barplot(
  table(mtcars$cyl),
  main = "Barplot of Cylender",
  xlab = "#of Cylender",
  ylab = "frequency",
  col = "red"
)
barplot(
  table(mtcars$gear),
  main = "Barplot of Gear",
  xlab = "#of Gear",
  ylab = "frequency",
  col = "green"
)
par(mfcol = c(1, 1))

wt <- mtcars$wt
mpg <-  mtcars$mpg
plot(
  wt,
  mpg,
  main = "중량 - 연비 그래프",
  xlab = "중량",
  ylab = "연비(MPG)",
  col = "red",
  pch = 18
)

vars <- c("mpg", "disp", "drat", "wt")
target <- mtcars[, vars]
head(target)
pairs(target,
      main = "Multi Plots")
