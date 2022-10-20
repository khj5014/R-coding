#13 - 1
install.packages("mlbench")
library(mlbench)

data("Ionosphere")
myds <- Ionosphere[, 3:12]

#13 - 2
data("Ionosphere")
myds <- Ionosphere[, 3:12]
cors <- c()
k <-  1
for (i in 1:(ncol(myds) - 1)) {
  for (j in i + 1:(ncol(myds) - i)) {
    cors[3 * k - 2] <- i
    cors[3 * k - 1] <- j
    cors[3 * k] <- cor(myds[, i], myds[, j])
    k <- k + 1
  }
}
length(cors)
idx <- 1:length(cors)
idx.max <- which.max(abs(cors[idx %% 3 == 0]))
cat("          두 변수 : ", colnames(myds)[cors[idx.max * 3 - 2]],"&",colnames(myds)[cors[idx.max * 3 - 1]],
    "\n 두 변수의 상관계수: ", cors[idx.max * 3])

#14
years <- 1875:1972
hlevel <- as.vector(LakeHuron)
plot(years, hlevel, type = "l", col = "blue")

#15
AirPassengers
colnames(AirPassengers)

exMonth <- function(y) {
  return(AirPassengers[((y - 1949) * 12 + 1):((y - 1949) * 12 + 12)]) #n- 시작월 ~ 12 월반환
}

exMonth(1949)
exMonth(1955)
exMonth(1960)

plot_val <- c(exMonth(1949), exMonth(1955), exMonth(1960))

plot(
  exMonth(1949) ,
  ylim = c(min(plot_val), max(plot_val)) ,
  col = 'red' ,
  type = 'l'
)
lines(exMonth(1955), col = 'blue', type = 'l')
lines(exMonth(1960), col = 'green', type = 'l')

#16

USAccDeaths

exMonth2 <- function(x) {
  return(USAccDeaths[(((x - 1973) * 1 + 1):((x - 1973) * 12 + 12))])
}
p16_val <- c(exMonth2(1973), exMonth2(1975), exMonth2(1977))

plot(
  exMonth2(1973),
  ylim = c(min(p16_val), max(p16_val)) ,
  type = 'l' ,
  col = 'red'
)
lines(exMonth2(1975), type = 'l' , col = 'blue')
lines(exMonth2(1977), type = 'l' , col = 'green')
legend("topright",legend = c('1973', '1975', '1977'),fill = c('red', 'blue', 'green') ,box.lty = 0,cex = 1)

colnames(USAccDeaths)