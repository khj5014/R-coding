x<-c(1,2,3,4,5)
x[2]
x[c(1,3,5)]
x[-c(2,4)]
x[x>2]
x[x>=2 & x<=4]
x[2] <- 20
x
x[c(3,4)] <- 15
x
x[x<=15] <-10
x
x[x>=15] <-10
x

x<-array(1:6,dim = c(2,3))
x

x<-data.frame(성명=c("홍길동","손오공"),나이=c(20,30),주소=c("서울","부산"))
x<-cbind(x,학과=c("e-비즈","경영"))
x
x<-rbind(x,data.frame(성명="장발장",나이=40,주소="파리",학과="행정"))
x
x[3, 2]
x[3,]
x[-2,]
x["성명"]
x$성명
x[["성명"]]
x[[1]]
x[[1]][2]

data(quakes)
quakes
head(quakes, n= 10)
tail(quakes, n = 6)
names(quakes)
str(quakes)
dim(quakes)
summary(quakes)
summary(quakes$mag)
