score <- c(76,84,69,50,95,60,82,71,88,84)
which(score==69)
which(score>=85)
max(score)
which.max(score)
min(score)
which.min(score)

idx <- which(score<=60)
score[idx] <- 61
score

idx <- which(score>=80)
score.high <- score[idx]
score.high

idx <-which(iris$Petal.Length>5.0)
idx
iris.big <- iris[idx,3]
iris.big

idx <- which(iris[,1:4]>5.0, arr.ind =TRUE)
idx

favorite <- c('WINTER', 'SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL','SUMMER','SPRING','SPRING')
favorite

table(favorite)
table(favorite)/length(favorite)

ds <- table(favorite)
ds
barplot(ds, main = 'favorite season')
pie(ds, main = 'favorite season')

favorite.color <-c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds <- table(favorite.color)
ds
barplot(ds, main = 'favorite season')
colors <- c('green','red', 'blue')
names(ds) <- colors
ds
barplot(ds, main = 'favorite season', col = colors)
pie(ds, main = 'favorite season', col = colors)

weight <- c(60,062,64,65,68,69)
weight.heavy <- c(weight,120)
weight
weight.heavy

mean(weight)
mean(weight.heavy)

median(weight)
median(weight.heavy)

mean(weight, trim=0.2)
mean(weight.heavy,trim=0.2)

