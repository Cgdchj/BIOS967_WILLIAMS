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

ggplot(data=Logger_All,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()
#Thursday: Figure out how to properly graph this so that dates aren't a problem on the x-axis




####Calculate variance and get weather station data for loggers###
mean(Logger_Nests$Value)#=30.34265
var(Logger_Nests$Value)#83.33992

mean(Logger_2$Value)#28.80503
var(Logger_2$Value)#71.68544

mean(Logger_3$Value)#32.83333
var(Logger_3$Value)#99.94048

mean(Logger_N$Value)#34.86538
var(Logger_N$Value)#1.491154
#Tuesday: Plot logger Varience and means