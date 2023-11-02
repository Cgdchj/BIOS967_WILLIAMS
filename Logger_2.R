library(tidyverse)
library(lubridate)
library(readr)
#import data
Logger_2 <- read.csv("Logger 2.csv")
#convert "Date.Time" to date-time object and save.
Logger_2 = Logger_2 %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_2,mapping=aes(x=date_time, y=Value))+
  geom_path()

#zoom in to specific date/time range by filtering the data
ggplot(data=Logger_2 %>% filter(date_time>mdy_hm("6/13/2023 10:00")&date_time<mdy_hm("6/13/2023 18:00")),mapping=aes(x=date_time, y=Value))+
  geom_path() +
  geom_point()
