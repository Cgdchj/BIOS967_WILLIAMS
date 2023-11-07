Logger_F <- read.csv("Logger F.csv")
Logger_F

Logger_F = Logger_F %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_F,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()
