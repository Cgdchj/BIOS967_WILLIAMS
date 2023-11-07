Logger_N <- read.csv("Logger N.csv")
Logger_N

Logger_N = Logger_N %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_N,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

