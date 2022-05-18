x<-read.csv("C:/Users/pc/Desktop/TCS_광주전남권톨게이트진출입일교통량_1일_분기_2021_4qt.csv", header=T)
x
head(x, n=7*2)

write.table(x,"C:/Users/pc/Desktop/TCS_광주전남권톨게이트진출입일교통량_1일_분기_2021_4qt.txt", sep=",")