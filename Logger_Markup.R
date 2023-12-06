#1.show all data, ggplot with all 4 loggers, explain data. N&F on dif days, so squished in corner
#2. Show plot of loggers 2&3 on same day, ggplot and box plot. Explain that they were still laying eggs, so not FULL incubation (#2 more nest attendance than #3)
#3. Show plot for N&F. ggplot and boxplot
#4. Line scatter graph for N&F to show nest attendance

#Load packages
library(tidyverse)
library(lubridate)
library(ggplot2)
###1###
#import all loggers
Logger_2 <- read.csv("Logger 2.csv")
Logger_2 = Logger_2 %>% mutate(date_time=mdy_hm(Date.Time))

Logger_3 <- read.csv("Logger 3.csv")
Logger_3 = Logger_3 %>% mutate(date_time=mdy_hm(Date.Time))

Logger_F <- read.csv("Logger F.csv")
Logger_F = Logger_F %>% mutate(date_time=mdy_hm(Date.Time))

Logger_N <- read.csv("Logger N.csv")
Logger_N = Logger_N %>% mutate(date_time=mdy_hm(Date.Time))

#Create column to assign data to logger
Logger_N$logger="N"
Logger_F$logger="F"
Logger_2$logger="2"
Logger_3$logger="3"

#Combine and plot All Loggers
Logger_All=bind_rows(Logger_N, Logger_F, Logger_2, Logger_3)

ggplot(data=Logger_All,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()+
  labs(x="Date", y="Temperature (\u00B0C)")

##2##
#Combine  loggers 2&3
Loggers_23=bind_rows(Logger_2,Logger_3)
#Filter data to match times for logger N (10am-2pm) and plot
dat23=Loggers_23 %>% filter(date_time>ymd_hms("2023-06-15 10:00:00")&date_time<ymd_hms("2023-06-15 14:00:00"))

ggplot(data=dat23,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()+
  labs(y="Nest Temperature (\u00B0C)", x="Time")

#make boxplot to look at means
ggplot(data=dat23, aes(x=logger, y=Value)) +
  geom_boxplot()+
  labs(y="Nest Temperature(\u00B0C)", x="Logger")

##3##
#combine and plot loggers N&F
Logger_NF=bind_rows(Logger_N, Logger_F)

ggplot(data=Logger_NF,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()+
  labs(y="Nest Temperature(\u00B0C)", x="Time")

#make boxplot to look at means
ggplot(data=Logger_NF, aes(x=logger, y=Value)) +
  geom_boxplot()+
  labs(y="Nest Temperature(\u00B0C)", x="Logger")

##4##
#Perform Linear regression for loggers N&F
#combine Logger N & F temperature data
LogNF_temps=cbind(Logger_F$Value,Logger_N$Value)
#convert to a data frame
datNF=as.data.frame(LogNF_temps)
#plot N vs F
ggplot(data=datNF,mapping=aes(x=V1,y=V2))+
  geom_point() +
  geom_smooth(method="lm")+
  lims(y=c(32,55), x=c(32,55))+
  labs(y="Nest Temperature",x="Ambeint Temperature")



