#파이차트
install.packages("graphics")
library(graphics)
x <- c(9,15,20,6)
label <- c("영업1팀","영업2팀","영업3팀","영업4팀")
pie(x, labels=label, main= "부서별 영업실적")

pie(rep(1, 24), col = rainbow(24), radius = 0.9)
#단순 파이챠트
pie(x, init.angle=90, labels=label, main= "부서별 영업실적")
pct<-round(x/sum(x)*100)
label<-paste(label, pct)
label<-paste(label, "%", sep="")
pie(x, labels=label, init.angle=90, col=rainbow(length(x)),
      main="부서별 영업실적")

#3D 파이차트
install.packages("plotrix")
library(plotrix)
pie3D(x, labels=label, explode=0.1, labelcex=0.8, main="부서
별 영업실적")

#일반 막대그래프
height <- c(9,15,20,6)
name <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀" )

barplot(height, names.arg=name,main="부서별 영업실적")

#막대색상 무지개개
barplot(height, names.arg=name,main="부서별 영업실적"
        ,col=rainbow(length(height)))

# x, y축 제목 설정
barplot(height, names.arg=name,main="부서별 영업실적"
        ,col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억원)")

# y축 단위 설정
barplot(height, names.arg=name,main="부서별 영업실적"
        ,col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억원)",
        ylim=c(0,25))

#막대위에 텍스트
bp <- barplot(height, names.arg=name,main="부서별 영업실적"
              ,col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억원)",
              ylim=c(0,25))
text(x=bp,y=height,labels=round(height,0),pos=3)

#막대내부에 텍스트
bp <- barplot(height, names.arg=name,main="부서별 영업실적"
              ,col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억원)",
              ylim=c(0,25))
text(x=bp,y=height,labels=round(height,0),pos=1)

#수평 그래프
barplot(height, names.arg=name, main = "부서별 영업실적",
        col=rainbow(length(height)), xlab="영업 실적(억원)",
        ylab="부서", xlim=c(0,25), horiz=TRUE, width=1)

#그룹화된 바 챠트 생성(스택형)
height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)
height <- rbind(height1,height2)

name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
legend_lbl <- c("2015년", "2016년")
barplot(height, main = "부서별 영업 실적", names.arg=name, xlab="부서",
        ylab="영업실적(억 원)", col =c("darkblue","red"),
        legend.text=legend_lbl, ylim=c(0,35))

#그룹형 바 차트
barplot(height, main = "부서별 영업 실적", names.arg=name, xlab="부서",
        ylab="영업실적(억 원)", col =c("darkblue","red"),
        legend.text=legend_lbl, ylim=c(0,30),
        beside=TRUE, args.legend=list(x='top'))

#플로팅 차트
data(women)
women

weight <- women$weight
height <- women$height
plot(height, weight, xlab="키", ylab="몸무게")

#산포도 차트
data(women)
women

weight <- women$weight
height <- women$height
plot(height, weight, xlab="키", ylab="몸무게", pch=120,#아스키코드
col="blue", bg="yellow", cex=1.5)


#히스토그램(기본)
data(quakes)
head(quakes)
mag <- quakes$mag
mag
hist(mag, main = "지진 발생 강도의 분포", xlab="지진 강도",ylab="발생 건수")
#히스토그램(색깔)
colors <- c("red","orange","yellow","green","blue","navy","violet")
hist(mag, main = "지진 발생 강도의 분포", xlab="지진 강도",ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5 ,by=0.5))
#히스토그램(비율)
hist(mag, main = "지진 발생 강도의 분포", xlab="지진 강도",ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5 ,by=0.5),freq=FALSE)

#박스플롯
data(quakes)
head(quakes)

mag <- quakes$mag
mag

min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main="지진 발생 강도의 분포", 
        xlab="지진", ylab="발생 건수", col="red")


#실습과제 CDnow 판매량
url <-"https://raw.githubusercontent.com/cran/btyd/master/data/cdnowElog.csv"
data <- read.csv(url, header = T)
quantity <- data$cds #거래량
histo <- hist(quantity, main = "CDNow CD판매량", xlab="거래량", ylab="빈도",
     col=rainbow(7), border=rainbow(7), xlim=c(1,40), ylim=c(0,3500), labels=TRUE,
     breaks=seq(0,40,by=1))
text(histo$mids, 0)


#애니메이션1(카운트다운)
library(animation)
ani.options(interval = 1)

for(i in 0:10){
  plot.new()
  rect(0,0,1,1,col="yellow")
  size = i
  text(0.5,0.5 , i, cex=size, col=rgb(0,0,1,1))
  ani.pause()
}

#애니메이션2(움직이는 차트)
library(animation)
ani.options(interval = 1)

while(TRUE){
  y <- runif(5,0,1)
  barplot(y,ylim=c(0,1), col=rainbow(5))
  ani.pause()
}
#애니메이션3(움직이는 그림)
library(animation)
library(png)
ani.options(interval = 0.5)
for(i in 1:6){
  img <- paste("C://temp/ball", i, ".png", sep="")
  img <- readPNG(img)
  plot.new()
  rect(0,0,1,1,col="white")
  rasterImage(img, 0,0,1,1)
  ani.pause()
}
dev.off()