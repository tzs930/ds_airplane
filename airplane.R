#install.packages("stringr")
library(ggplot2)
library(dplyr)
library(stringr)

setwd('/Users/Seokin/Desktop/datascience')
airplane <- read.csv("airplane_crash.txt")

airplane %>% 
  filter( !is.na(Aboard) && !is.na(Date) && !is.na(Operator) && !is.na(Fatalities) ) %>%
  #mutate( Country = matrix(unlist(strsplit(toString(Location),", ")),ncol=2)[,2] ) %>%
  select( Date, Operator, Aboard, Fatalities ) %>%
  group_by( Operator ) %>%
  summarize( TotalFatal= sum(Fatalities) , AvgFatal = mean(Fatalities)) %>%
  arrange( -TotalFatal ) %>% 
  head(20) %>% ggplot(aes(Operator, TotalFatal)) + geom_histogram(alpha=.5)
