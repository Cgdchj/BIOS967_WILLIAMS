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

Logger_N$logger="N"
Logger_F$logger="F"
Logger_NF=bind_rows(Logger_N, Logger_F)

ggplot(data=Logger_NF,mapping=aes(x=date_time, y=Value, group=logger, color=logger))+
  geom_path()+
  geom_point()




