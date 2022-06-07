x<-read.csv("C:/Users/pc/Desktop/220426-Bigdata-grade-exam.csv", header=T)
x
head(x, n=10)
write.table(x,"C:/Users/pc/Desktop/220426-Bigdata-grade-exam.xls", sep=",")



install.packages("graphics")
library(graphics)

x<-read.csv("C:/Users/pc/Desktop/220426-Bigdata-grade-exam.csv", header=T)
x
head(x)
midExam <- x$midExam
midExam

colors <- c("red","orange","yellow","green","blue","navy","violet")
hist(midExam, main = "광주대 중간고사 점수", xlab="점수 구간",ylab="학생 수",
     col=colors, breaks=seq(0,100 ,by=10))

x <- data("iris")
summary(x)

install.packages("ggplot2")
library(ggplot2)
names <- c("1.도담삼봉/석문", "2.구담/옥순봉", "3.사
인암", "4.하선암", "5.중선암", "6.상선암","7.단양팔경 휴게소","팔경가든")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-13",
            "충청북도 제천시 수산면 계란리 6-5",
            "충청북도 단양군 대강면 사인암2길 42",
            "충청북도 단양군 단성면 대잠리 295",
            "충청북도 단양군 단성면 가산리 705",
            "충청북도 단양군 단성면 가산리 733-1",
            "매포읍 상시리 242-6",
            "단성면 외중방리 295-1")
register_google(key="AIzaSyC_4ZztF14h3G5p2A1HQTewgfKTeVKmcVk")
gc <- geocode(enc2utf8(addr))
gc
33

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
cen
map <- get_googlemap(center=cen, maptype="roadmap", 
                       zoom=11, marker=gc)
ggmap(map)