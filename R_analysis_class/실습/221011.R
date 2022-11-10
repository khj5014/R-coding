# 산점도
iris.2 <- iris[, 3:4]
point <- as.numeric(iris$Species)
point
color <- c("red", "green", "blue")
plot(iris.2,
     main = "Iris plot",
     pch = c(point),
     col = color[point])

# 상관계수 계산
beers = c(5, 2, 9, 8, 3, 7, 3, 5, 3, 5)
bal <-
  c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)
tbl <- data.frame(beers, bal)
tbl
plot(bal ~ beers, data = tbl)
res <- lm(bal ~ beers, data = tbl)
abline(res)
cor(beers, bal)

# 선그래프
month = 1:12
late = c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)
plot(
  month,
  late,
  main = "지각생 통계",
  type = "s",
  lty = 1,
  lwd = 1,
  xlab = "Month",
  ylab = "Late cnt"
)

#