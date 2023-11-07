Logger_3 <- read.csv("Logger 3.csv")
Logger_3

Logger_3 = Logger_3 %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_3,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()
