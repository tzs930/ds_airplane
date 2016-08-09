# install.packages("stringr")
library(ggplot2)
library(dplyr)

setwd('/Users/Seokin/Desktop/datascience')

# 1. Plot parameters
# Plot every possible graphs
Orange %>% plot()
# Plot Age vs Circumference
Orange %>% ggplot(aes(age,circumference)) + geom_point() + geom_smooth()
# Plot Tree vs Age
Orange %>% ggplot(aes(Tree,age)) + geom_boxplot()
# Plot Circumference vs Tree
Orange %>% ggplot(aes(circumference,Tree)) + geom_line()

# 2. Analyze parameters
#  1) 수량형 변수 : age vs circumference
#   step.1 자료분포 시각화
Orange %>% ggplot(aes(age)) + geom_histogram(bins=10)
Orange %>% ggplot(aes(circumference)) + geom_histogram()

#   step.2 요약통계량 파악
summary(Orange)

#   step.3 자료의 정규성 검사
qqplot(Orange$age, Orange$circumference)

#   step.4 가설검정 / 신뢰구간
t.test(Orange$circumference)

#   step.5 이상점 파악 (로버스트 통계량)
Orange %>% ggplot(aes(Tree,circumference)) + geom_boxplot()
me = median(Orange$circumference)
ma = mad(Orange$circumference)

#  2) 범주형 변수 : circumference vs Tree
#    step.1 요약통계량 파악

