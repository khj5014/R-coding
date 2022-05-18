#차트그리기
height<- c(9,15,20,6)
name<- c("영업1팀","영업2팀","영업3팀","영업4팀")
barplot(height,names.arg=name,main="부서별 영업실적", col=rainbow(length(height)),xlab="부서",ylab="영업실적(억원)")

install.packages("animation")
library(animation)

ani.options(interval = 1)


  
#애니메이션 만들기
# rect
# text=(수평,수직, i값 )  cex=글자크기
for(i in 10:0){
  plot.new()
  rect(0, 0, 1 ,1, col="yellow")
  text(0.5, 0.5, i, cex=20, col=rgb(.2,.2,.2,.7))
  ani.pause()
}

#구글맵 
install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages("ggmap")
library(ggplot2)
library(RgoogleMaps)
library(ggmap)

names <- c("1.도담삼봉/석문", "2.구담/옥순봉",
           "3.사인암", "4.하선암", "5.중선암", "6.상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로644-13",
          "충청북도 제천시 수산면 계란리 6-5",
          "충청북도 단양군 대강면 사인암2길 42",
          "충청북도 단양군 단성면 대잠리 295",
          "충청북도 단양군 단성면 가산리 705",
          "충청북도 단양군 단성면 가산리 733-1")

register_google(key="AIzaSyC_4ZztF14h3G5p2A1HQTewgfKTeVKmcVk")
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names,lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat))
cen

map <- get_googlemap(center=cen,
                     maptype = "roadmap",zoom = 11,
                     markers = gc)
ggmap(map,fullpage = TRUE)

#워드클라우드

install.packages("wordcloud")
install.packages("RColorBrewer")
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
x <- c("국민", "신한국사회", "민족")
y <- c(5, 4, 3)
wordcloud(x, y, colors=pal2)

# R스크립트

iteration <- 5000
plot(0, 0, xlab="동전을 던진 횟수", ylab="앞면이 나오는 비율",
     xlim=c(0,iteration), ylim=c(0,1))

abline(a=0.5, b=0, col="red")

sum <- 0

for(x in 1:iteration){
  y <- sample(c("앞면","뒷면"), 1, replace=T)
  if(y=="앞면")
    sum=sum+1
prob <- sum/x
points(x, prob)
}