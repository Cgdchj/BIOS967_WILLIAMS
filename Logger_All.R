library(tidyverse)
library(lubridate)
#import all loggers
Logger_2 <- read.csv("Logger 2.csv")
Logger_2 = Logger_2 %>% mutate(date_time=mdy_hm(Date.Time))

Logger_3 <- read.csv("Logger 3.csv")
Logger_3 = Logger_3 %>% mutate(date_time=mdy_hm(Date.Time))

Logger_F <- read.csv("Logger F.csv")
Logger_F = Logger_F %>% mutate(date_time=mdy_hm(Date.Time))

Logger_N <- read.csv("Logger N.csv")
Logger_N = Logger_N %>% mutate(date_time=mdy_hm(Date.Time))

# Cobine all loggers

#create logger catergories first
Logger_N$logger="N"
Logger_F$logger="F"
Logger_2$logger="2"
Logger_3$logger="3"
#combine loggers
Logger_All=bind_rows(Logger_N, Logger_F, Logger_2, Logger_3)
Logger_Nests=bind_rows(Logger_N,Logger_2,Logger_3)
Loggers_23=bind_rows(Logger_2,Logger_3)

ggplot(data=Logger_Nests,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()
#Thursday: Figure out how to properly graph this so that dates aren't a problem on the x-axis


## box plot for loggers
ggplot(data=Logger_Nests, aes(x=logger, y=Value)) +
  geom_boxplot()

ggplot(data=Logger_Nests, aes(x=logger, y=Value)) +
  geom_violin()

####Calculate variance and get weather station data for loggers###
mean(Logger_Nests$Value)#30.34265
var(Logger_Nests$Value)#83.33992

mean(Logger_2$Value)#28.80503
var(Logger_2$Value)#71.68544

mean(Logger_3$Value)#32.83333
var(Logger_3$Value)#99.94048

mean(Logger_N$Value)#34.86538
var(Logger_N$Value)#1.491154


#Tuesday: Plot logger Variance and means
mean(Logger_F$Value)#45.82
var(Logger_F$Value)#32.28917

### select correct times
#loggers N & F are 6/23 between 10am and 2pm
#logger 2 is between 6/12 2pm- 6/16 2pm
#logger 3 is between 6/14 10:40am - 6/16 2pm
###Sellect 6/15/23 between 10am and 2pm for loggers 2 & 3

dat23=Loggers_23 %>% filter(date_time>ymd_hms("2023-06-15 10:00:00")&date_time<ymd_hms("2023-06-15 14:00:00"))

ggplot(data=dat23, aes(x=logger, y=Value)) +
  geom_boxplot()+
  labs(y="Nest Temperature", x="Loggers")

#Plot means of all 3 nest loggers
dat23N=bind_rows(Loggers_23,Logger_N)

ggplot(data=dat23N,aes(x=logger,y=Value))+
  geom_boxplot()+
  labs(x="Logger",y="Nest Temperature")

#Plot loggers 2 & 3
ggplot(data=dat23,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()+
  labs(y="Nest Temperature",x="Time")





