library(tidyverse)
library(readxl)

# install.packages("tidyverse")

yang <- read_excel("양준혁.xlsx") %>% 
  .[-17:-18, ]
# Ctrl + Shift + M : Pipe Operator

# 볼넷 변수를 가지고 계산

yang$볼넷

# 기초통계량
# 1. 대표값
# 1-1 평균 : 합계 / 표본의크기
mean(yang$볼넷)
sum(yang$볼넷) / length(yang$볼넷)

# 1-2 중앙값
median(yang$볼넷)

# 2. 산포의 정도(퍼진 정도) = 대표값의 성능을 측정한다. 편차가 적으면 대표값이 더 성능이 좋다.
# 2-1 범위 (range) : 최대값 - 최소값
# 최대값
max(yang$볼넷)
# 최소값
min(yang$볼넷)
# 범위
max(yang$볼넷) - min(yang$볼넷)

# 2-2 사분범위수 (quartile range) : 3Q - 1Q
quantile(yang$볼넷)

quantile(yang$볼넷)[4] - quantile(yang$볼넷)[2] # 3Q - 1Q

# 2-3 편차 : 값 - 평균

yang$볼넷 - mean(yang$볼넷) # 편차
mean(yang$볼넷 - mean(yang$볼넷))

# 2-3.5 절대편차
abs(yang$볼넷 - mean(yang$볼넷))
mean(abs(yang$볼넷 - mean(yang$볼넷)))

# 2-4 분산/표준편차 : 
# 2-4-1 분산: 편차^2의 합 / 표본의 크기로 나눈 것 = 편차^2의 평균
sum((yang$볼넷 - mean(yang$볼넷))^2) / length(yang$볼넷) # 분산
mean((yang$볼넷 - mean(yang$볼넷))^2) # 분산

# 2-4-1 표준편차 = 분산에 루트를 씌움 (분산의 제곱근)
sqrt(mean((yang$볼넷 - mean(yang$볼넷))^2)) #표준편차

# 3. 그래프 그리기 

# boxplot
boxplot(yang$볼넷)
boxplot(yang$볼넷, horizontal = TRUE)

# ggplot을 이용한 boxplot
ggplot(yang, aes(x = 볼넷)) +
  geom_boxplot(fill = "skyblue")

# histogram
hist(yang$볼넷)

# ggplot을 이용한 histogram
ggplot(yang, aes(x = 볼넷)) +
  geom_histogram()
