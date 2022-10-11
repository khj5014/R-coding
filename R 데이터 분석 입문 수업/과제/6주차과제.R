# 1-1
edu <- infert[, "education"]
edu

#1-2
unique(edu)

#1-3
table(edu) / length(edu)

#1-4
barplot(table(edu) / length(edu), main = "Education")
#2-1
gender <- c("F", "F", "F", "M", "M", "F", "F", "F", "M", "M")

#2-2
table(gender) / length(gender)

#2-3
barplot(table(gender) / length(gender), main = "Gender")

#2-4
pie(table(gender) / length(gender), main = "Gender")

#3-1
season <- c("여름", "겨울", "봄", "가을", "여름", "가을", "겨울", "여름", "여름", "가을")

#3-2
table(season) / length(season)

#3-3
barplot(table(season) / length(season), main = "Season")

#3-4
pie(table(season) / length(season), main = "Season")

#4-1
score <- c(90, 85, 73, 80, 85, 65, 78, 50, 68, 96)
names(score) <- c("KOR", "ENG", "ATH", "HIST", "SOC", "MUSIC", "BIO", "EARTH", "PHY", "ART")

#4-2
score

#4-3
mean(score)
median(score)

#4-4
sd(score)

#4-5
names(which.max(score))

#4-6
boxplot(score)
boxplot.stats(score)$out

#4-7
hist(score, main = "학생 성적", col = "purple")

#5-1
mean(mtcars[, "wt"])
median(mtcars[, "wt"])
quantile(mtcars[, "wt"])
sd(mtcars[, "wt"])

#5-2
summary(mtcars[, "wt"])

#5-3
table(mtcars[, "cyl"]) / length(mtcars[, "cyl"])

#5-4
barplot(table(mtcars[, "cyl"]) / length(mtcars[, "cyl"]), main = "실린더수 도수 분포표")

#5-5
hist(mtcars[, "wt"], main = "중량")

#5-6
boxplot(mtcars[, "wt"], main = "중량 박스 그래프")
boxplot.stats(mtcars[, "wt"])

#5-7
boxplot(mtcars[, "disp"], main = "배기량 박스 그래프")
boxplot.stats(mtcars[, "disp"])

#5-8
boxplot(mpg ~ gear, mtcars, main = "기어수")
c(boxplot.stats(mtcars[which(mtcars$gear == 3), "mpg"]),
boxplot.stats(mtcars[which(mtcars$gear == 4), "mpg"]),
boxplot.stats(mtcars[which(mtcars$gear == 5), "mpg"])
)

#6-1
head(trees)

#6-2
mean(trees$Girth)
median(trees$Girth)
mean(trees$Girth, trim = 0.15)
sd(trees$Girth)

#6-3
hist(trees$Girth)

#6-4
boxplot(trees$Girth)

#6-5
mean(trees$Height)
median(trees$Height)
mean(trees$Height, trim = 0.15)
sd(trees$Height)

#6-6
hist(trees$Height)

#6-7
boxplot(trees$Height)

#7-1
head(Orange)

#7-2
mean(Orange$age)
median(Orange$age)
mean(Orange$age, trim = 0.15)
sd(Orange$age)

#7-3
hist(Orange$age)

#7-4
boxplot(age ~ Tree, data = Orange)

#7-5
orangeWithout2 <- Orange[-which(Orange$Tree == 2),]
orangeWithout2
mean(orangeWithout2$circumference)
median(orangeWithout2$circumference)
mean(orangeWithout2$circumference, trim = 0.15)
sd(orangeWithout2$circumference)

#7-6
hist(orangeWithout2$circumference)

#7-7
boxplot(circumference ~ Tree, data = Orange)
