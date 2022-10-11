@@ -0,0 +1,121 @@
  install.packages("RCurl")
install.packages("XML")
install.packages("wordcloud")
install.packages("RmecabKo")
library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)
install_mecab("C:/Rlibs/mecab")
library(RmecabKo)


searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "btxlL0b20thvLgPaLFwt"
Client_Secret <- "EtM9QJcYf_"

query <- URLencode(iconv("인공지능", "euc-kr", "UTF-8"))
query2 <- URLencode(iconv("여행", "euc-kr", "UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=20", sep="")

doc <- getURL(url,
              httpheader = c('Content-Type' = "application/xml",
                             'X-Naver-Client-Id' = Client_ID,
                             'X-Naver-Client-Secret' = Client_Secret))
doc

xmlFile <- xmlParse(doc) #xml문서구조 변환
df <- xmlToDataFrame(getNodeSet(xmlFile,"//item")) #뉴스 추출
str(df) #데이터프레임 구조

description <- df[,4]
description

description2 <- gsub("\\d|<b>|</b>|&quot;","",description) #뉴스데이터정제
description2

#단어추출
nouns <- nouns(iconv(description2,"utf-8"))
nouns
#각 리스트의 단어들을 하나의 백터로 통합
nouns.all <- unlist(nouns,use.names = F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all)<=1]
nouns.all1

nouns.all2 <- nouns.all[nchar(nouns.all)>=2]
nouns.all2


#단어 빈도
nouns.freq <- table(nouns.all2)
nouns.freq
#단어 빈도 데이터프레임으로 생성성
nouns.df <- data.frame(nouns.freq, stringsAsFactors = F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]
nouns.df.sort

wordcloud(nouns.df.sort[,1],
          freq = nouns.df.sort[,2],
          min.freq = 1,
          scale=c(3,0.7),
          rot.per = 0.25,
          random.order = F,
          random.color = T,
          colors=rainbow(10))

#------------- 추가 블로그 데이터 실습--------------
search_url2 <- "https://openapi.naver.com/v1/search/blog.xml"

url2 <- paste(search_url2,"?query=",query2,"&display=20", sep="")
url2

doc2 <- getURL(url2, httpheader =c('Content-Type' = "application/xml",
                                   'X-Naver-Client-Id' = Client_ID,
                                   'X-Naver-Client-Secret' = Client_Secret))
doc2

xml2 <- xmlParse(doc2)
xml2
df2 <- xmlToDataFrame(getNodeSet( xml2,"//item"))
str(df2)

description <- df2[,3]
description

description_gsubed <- gsub("\\d|<b>`|</b>|&quot;","",description)



nouns <- nouns(iconv(description_gsubed, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names =F)

nouns.all1 <- nouns.all[nchar(nouns.all)<=1]
nouns.all1 

nouns.all2 <- nouns.all[nchar(nouns.all)>=2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq,stringsAsFactors = F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]
nouns.df.sort

wordcloud(nouns.df.sort[,1],
          freq=nouns.df.sort[,2],
          min.freq=1,
          scale =c(3,0.6),
          rot.per =0.25,
          random.order= F,
          random.color= T,
          colors=rainbow(10)
)