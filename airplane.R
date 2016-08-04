#install.packages("stringr")
library(ggplot2)
library(dplyr)
library(stringr)

#setwd('/Users/Seokin/Desktop/datascience')
airplane <- read.csv("airplane_crash.txt")

airplane %>% 
  filter( !is.na(Aboard) ) %>%
  #mutate( Country = matrix(unlist(strsplit(toString(Location),",")),ncol=2, bycol=T )[,2] ) %>%
  #select( Date, Country, Aboard ) %>%
  #group_by( Country ) %>%
  select( Date, Location, Aboard ) %>%
  group_by(Location) %>%
  summarize( m = mean(Aboard) ) %>%
  arrange( -m )


