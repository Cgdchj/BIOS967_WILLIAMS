Logger_N <- read.csv("Logger N.csv")
Logger_N

Logger_N = Logger_N %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_N,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

Logger_F <- read.csv("Logger F.csv")
Logger_F

Logger_F = Logger_F %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_F,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

#Create additional column categorizing which logger data came from
Logger_N$logger="N"
Logger_F$logger="F"
#combine loggers
Logger_NF=bind_rows(Logger_N, Logger_F)

ggplot(data=Logger_NF,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()
#remove first point from logger N

#combine Logger N & F temp data
LogNF_temps=cbind(Logger_F$Value,Logger_N$Value)

#this needs to be a data frame
datNF=as.data.frame(LogNF_temps)
datNF


#plot N vs F
ggplot(data=datNF,mapping=aes(x=V1,y=V2,group=V1))+
  geom_point()

#we need the times back...how do I do that????