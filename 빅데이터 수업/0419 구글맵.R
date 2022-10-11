install.packages("ggmap")
library("ggmap")
register_google(key="AIzaSyDREYkDjFtiBgKwlF-gHNmEYqD2kzr5X00")

#서울지도
gc <- geocode(enc2utf8('서울'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen)
ggmap(map)




#단양군 지도도
gc <- geocode(enc2utf8('충청북도 단양군'))
cen <- as.numeric(gc)

#위경도 표시 O
map <- get_googlemap(center=cen, maptype = "terrain",
                     marker=gc)
ggmap(map)

#위경도 표시 x
map <- get_googlemap(center=cen, maptype = "roadmap",
                     marker=gc)
ggmap(map, extent = "device")

#단양팔경 위치의 마커 출력
install.packages("ggplot2")
library(ggplot2)
names <- c("1.도담삼봉/석문", "2.구담/옥순봉", "3.사인암",
           "4.하선암", "5.중선암", "6.상선암","7.수양개빛터널")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-13",
          "충청북도 제천시 수산면 계란리 6-5",
          "충청북도 단양군 대강면 사인암2길 42",
          "충청북도 단양군 단성면 대잠리 295",
          "충청북도 단양군 단성면 가산리 705",
          "충청북도 단양군 단성면 가산리 733-1",
          "적성면 수양개유적로 390")

register_google(key="AIzaSyDREYkDjFtiBgKwlF-gHNmEYqD2kzr5X00")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
cen
map <- get_googlemap(center = cen, maptype ="roadmap",zoom = 11, markers = gc)
gmap <- ggmap(map)
#마커에 문자 추가
gmap + geom_text(data=df, aes(x = lon, y = lat), size=5,
                 label=df$name)

#범례 출력
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=11)
gmap <- ggmap(map, fullpage=TRUE, legend="topright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)),
                   size=10, label=seq_along(df$name))

#지진데이터
library(ggmap)
df <- head(quakes,100)
df

cen <- c(mean(df$long),mean(df$lat))
cen

register_google(key="AIzaSyDREYkDjFtiBgKwlF-gHNmEYqD2kzr5X00")

gc <- data.frame(lon=df$long, lat=df$lat)
gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
gc

map <- get_googlemap(center = cen, scale = 1,
                     maptype = "roadmap", zoom = 4, marker = gc)
ggmap(map, extent = "device")


#지진 규모
map <- get_googlemap(center=cen, scale=1,
                     maptype="roadmap",zoom=5)
ggmap(map, fullpage = TRUE) + geom_point(data=df,
                                           aes(x=long, y=lat, size=mag), alpha=0.5)

