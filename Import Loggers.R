#Logger 2
Logger_2 <- read.csv("Logger 2.csv")
Logger_2

Logger_2 = Logger_2 %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_2,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

#logger 3
Logger_3 <- read.csv("Logger 3.csv")
Logger_3

Logger_3 = Logger_3 %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_3,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

#logger N
Logger_N <- read.csv("Logger N.csv")
Logger_N

Logger_N = Logger_N %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_N,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()

#Logger F
Logger_F <- read.csv("Logger F.csv")
Logger_F

Logger_F = Logger_F %>% mutate(date_time=mdy_hm(Date.Time))

ggplot(data=Logger_F,mapping=aes(x=date_time, y=Value))+
  geom_path()+
  geom_point()
