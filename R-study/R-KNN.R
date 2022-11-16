library(class)   # knn패키지 사용하기 위해
library(gmodels) # 크로스테이블 사용하기 위해
library(GGally)  # GGPAIRS 사용하기 위해

#작업 디렉토리 지정
setwd("D:\\R\\data")
WB <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

#id 빼고 실행 - 예측에 필요없는값
WB <- WB[-1]
WB

#악성(M) | 양성(B)
table(WB$diagnosis)

#데이터 팩터화
WB$diagnosis <- factor(WB$diagnosis,
                       levels = c("M", "B"),
                       labels = c("악성", "양성"))

#비율 확인 (round)소수점 반올림
round(prop.table(table(WB$diagnosis)) * 100, digits = 2)

#세부정보
summary(WB)

#데이터 표준화 - min - max 공식
normalize <-  function(x) {
    return((x - min(x)) / (max(x) - min(x)))
  }

# WB데이터의 2열부터 31열까지 표준화함수 적용
WB_n <- as.data.frame(lapply(WB[2:31], normalize))

#성능 체크를 위해 데이터를 나눔
#훈련 데이터
WB_train <- WB_n[1:469,]
WB_train

#테스트 데이터
WB_test <- WB_n[470:569,]
WB_test

#라벨값 따로 출력 -> 훈련데이터셋의 그룹이 됨
WB_train_diagnosis <- WB[1:469, 1]
WB_train_diagnosis

#테스트데이터의 실제 암 진단 결과 - 예측치 비교용 (성능 테스트용)
WB_test_diagnosis <- WB[470:569, 1]
WB_test_diagnosis

# KNN적용(k = 21)
WB_test_pred <-  knn(
  train = WB_train,        # 훈련 데이터
  test = WB_test,          # 분류 할 데이터
  cl = WB_train_diagnosis, # 훈련 데이터셋의 그룹
  k = 21                   # K = 이웃점의 갯수
)
WB_test_pred #결과 확인

#성능 테스트
CrossTable(x = WB_test_diagnosis, y = WB_test_pred, prop.chisq = FALSE)

# 최적의 k를 찾기
accuracy <- c()
for (i in 1:sqrt(nrow(WB))) {
  WB_test_pred <-  knn(
    train = WB_train,
    test = WB_test,
    cl = WB_train_diagnosis,
    k = i
  )
  WB_test_pred
  rslt <- table(WB_test_pred, WB_test_diagnosis)
  accuracy <- c(accuracy, sum(diag(rslt)) / sum(rslt)) #정확도
}

# 최적의 K
max(which(accuracy == max(accuracy)))

# K값 그래프
df.acc <- data.frame(accuracy)
ggplot(df.acc, aes(x = 1:length(accuracy), y = accuracy)) +
  geom_line() + geom_label(label = rownames(df.acc))

#평균에 대한 산점도 그래프
WB.ggp <- ggpairs(WB_n[, 1:5], aes(color = WB$diagnosis, alpha = 0.75), axisLabels ='internal')
WB.ggp
WB.ggp[3, 1]
