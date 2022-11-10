#웹스크랩
install.packages("rvest")
library(rvest)


data.page <- NULL

url.page <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=API&keyword=&detailKeyword=&publicDataPk=&recmSe=&detailText=&relatedKeyword=&commaNotInData=&commaAndData=&commaOrData=&must_not=&tabId=&dataSetCoreTf=&coreDataNm=&sort=updtDt&relRadio=&orgFullName=&orgFilter=&org=&orgSearch=&currentPage="

page.start <- 1
page.end  <- 5

api=data.frame()

for(p in page.start:page.end){

#웹문서읽기  
url <- paste(url.page, p, sep = "")
html <- read_html(url)
html

#데이터추출
data_cell <- html_nodes(html,"#apiDataList div ul li")
data_cell

title <- html_nodes(data_cell, ".title") %>%
  html_text()
title

desc <- html_nodes(data_cell, ".ellipsis") %>%
  html_text()
desc

info <- html_nodes(data_cell,".info-data") %>%
  html_text()
info

#데이터 정제
title <- gsub("[|\r|\n|\t]", "",title)
title

desc <- gsub("[|\r|\n|\t]", "",desc)
desc

info <- gsub("[|\r|\n|\t]", "",info)
info

api <- rbind(api, c(title,desc,info))
}

api


#---------네이버 영화 평점(단일)----------
url <- "https://movie.naver.com/movie/point/af/list.naver"
html <- read_html(url)
html
  
#---------데이터 추출------------
  
#리뷰 셀 추출
review_cell <- html_nodes(html,"#old_content table tr .title")
review_cell

#평점 추출
score <- html_nodes(review_cell,"em") %>%
html_text()
score
  
#저자 추출
author <- html_nodes(html,"#old_content .author") %>%
html_text()
author
  
#-------------정제---------------
  
review <- review_cell %>%
html_text()
review
  
index.start <- regexpr("\t별점 -", review)
index.start

index.end <- regexpr("\t신고",review)
index.end
  
review <- substring(review,index.start,index.end)
review <- substring(review,16)
review

#제어문자제거
review <- gsub("[\n|\t]", "", review)
review
  
#공백제거  
review <- trimws(review, "both")
review
  
Movie <- cbind(review, score, author)
Movie



#---------네이버 영화 평점(다수)----------
review.page <- NULL

url.page <- "https://movie.naver.com/movie/point/af/list.naver?&page="
page.start <- 1
page.end  <- 5

for(p in page.start:page.end){

url <- paste(url.page, p, sep = "")

html <- read_html(url)
html

#---------데이터 추출------------

#리뷰 셀 추출
review_cell <- html_nodes(html,"#old_content table tr .title")
review_cell

#평점 추출
score <- html_nodes(review_cell,"em") %>%
  html_text()
score

#저자 추출
author <- html_nodes(html,"#old_content .author") %>%
  html_text()
author

#-------------정제---------------

review <- review_cell %>%
  html_text()
review

index.start <- regexpr("\t별점 -", review)
index.start

index.end <- regexpr("\t신고",review)
index.end

review <- substring(review,index.start,index.end)
review <- substring(review,16)
review

#제어문자제거
review <- gsub("[\n|\t]", "", review)
review

#공백제거  
review <- trimws(review, "both")
review

review.page <- c(review.page, review, score, author)

}
review.page
