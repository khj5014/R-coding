#install.packages("XML")
#install.packages("ggplot2")
install.packages("ggmap")

#library(XML)
#library(ggplot2)
library(ggmap)

api <- "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"
api_key <-"QD9YlLTqKKylC%2FmLkSdAVBqCUKHsJH2ylvJfT8y3Oy1lrzlIbXcsmn1WksikySDRKQMw6A05Kxzn0UFv3ZL6sA%3D%3D"
sidoName <-URLencode('광주')
numOfRows <- 10
pageNo <- 1
returnType <- "xml"

url <- paste(api, "?serviceKey=", api_key,
             "&sidoName=", sidoName,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&returnType=", returnType,
             sep="")
url
xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
df
#특정 측정소의 지역별 미세먼지 농도 추출
pm <- df$pm10Value
pm

#지역별 미세먼지 농도의 지도 출력
register_google(key="AIzaSyDREYkDjFtiBgKwlF-gHNmEYqD2kzr5X00") # 구글 API KEY 입력
places <- df$stationName

gc <- geocode(enc2utf8(places))
df2<-data.frame(측정소=places, 미세먼지=pm, 경도=gc$lon, 위도=gc$lat, stringAsFactors=F)
df2

df2[,2]<-as.numeric(df2[,2])
cen <-as.numeric( geocode( enc2utf8("광주광역시")))
map<-get_googlemap(center=cen, zoom=12)
ggmap(map) +
  geom_point(data=df2, aes(x=경도, y=위도),
             color=rainbow(length(df2$미세먼지)),
             size=df2$미세먼지*0.3,
             alpha=0.5)
