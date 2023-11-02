library(readr)
Logger_2 <- read_csv("Logger 2.csv", col_types = cols(`Date/Time` = col_datetime(format = "%m/%d/%Y %H:%M")))
View(Logger_2)
ggplot(data=Logger_2,mapping=aes(x=`Date/Time`, y=Value))+
  geom_point()
str(Logger_2)
