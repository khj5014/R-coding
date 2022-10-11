x <- c(1,2,3)
y <- c(4,5,6)
x+y
x*y
z <- x+y
z
d <- c(1:10)
sum(d)
length(d)
mean(d[1:5])
max(d)
min(d)
sort(d)
sort(d, decreasing = FALSE)
sort(d, decreasing = TRUE)

v1 <- median(d)
v1
v2 <- sum(d)/length(d)
v2

d <- c(1:9)
d>=5
d[d>5]
sum(d>5)
sum(d[d>5])
d==5

condi <- d > 5 & d < 8
d[condi]

ds <-  c(90, 85, 70 , 84)
my.info <- list(name='Tom', age=60, status=TRUE, score=ds)
my.info
my.info[[1]]
my.info$name
my.info[[4]]

bt <- c('A','B','B','O','AB','A')
bt.new <- factor(bt)
bt
bt.new
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new)
bt.new[7] <- 'B'
bt.new[8] <- 'C'
bt.new