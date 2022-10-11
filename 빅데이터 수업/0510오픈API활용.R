#라이브러리
install.packages("XML")
install.packages("ggplot2")
library(XML)
library(ggplot2)

# url, API 설정
api <- "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"
api_key <- "064A1St1ze0smWMXAuYCz%2BUvDXKe%2FF1V9oFsiBDJQ2Bf5O5Y0Fmp6wyR3mCDwsqjdc3tzUPNTtuMp4Hvg4ebNA%3D%3D"
sidoName <-URLencode('서울')
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

# API호출
xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

#문서를 데이터 프레임변환환
df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

#미세먼지 농도 그래프
ggplot(data=df,aes(x=stationName, y=pm10Value)) + 
  geom_bar(stat = "identity", fill="green")

#라벨 수정
ggplot(data=df, aes(x=stationName, y=pm10Value)) +
  geom_bar(stat="identity", fill="green") +
  theme(axis.text.x=element_text(angle=90)) +
  labs(title="측정소별 서울지역의 미세먼지 농도", x="측정소", y="미세먼지 농도")

#막대 색
ggplot(data=df, aes(x=stationName, y=pm10Value)) +
  geom_bar(stat="identity", fill="green") +
  theme(axis.text.x=element_text(angle=90)) +
  labs(title="측정소별 서울지역의 미세먼지 농도", x="측정소", y="미세먼지 농도")
  scale_fill_manual(values = rainbow(10))

#범례 삭제
ggplot(data=df, aes(x=stationName, y=pm10Value)) +
  geom_bar(stat="identity", fill="green") +
  theme(axis.text.x=element_text(angle=90),legend.position = "none") +
  labs(title="측정소별 서울지역의 미세먼지 농도", x="측정소", y="미세먼지 농도")
  scale_fill_manual(values = rainbow(10))


#가로 막대
  ggplot(data=df, aes(x=stationName, y=pm10Value)) +
  geom_bar(stat="identity", fill="green") +
  theme(axis.text.x=element_text(angle=90), legend.position="none") +
  labs(title="측정소별 서울지역의 미세먼지 농도", x="측정소", y="미세먼지 농도") +
  scale_fill_manual(values=rainbow(10)) +
  coord_flip()