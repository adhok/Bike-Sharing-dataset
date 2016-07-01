

##########################################################################################

library(dplyr)
library(lubridate)
library(ggplot2)
library(readr)
library(scales)

train <- read.csv("train.csv")

train$hour  <- hour(ymd_hms(train$datetime))
train$times <- as.POSIXct(strftime(ymd_hms(train$datetime), format="%H:%M:%S"), format="%H:%M:%S")
train$day   <- wday(ymd_hms(train$datetime), label=TRUE)
p <- ggplot(train, aes(x=times, y=count, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Hour of the Day") +
  scale_x_datetime(breaks = date_breaks("4 hours"), labels=date_format("%I:%M %p")) + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("People rent bikes for morning/evening commutes on weekdays, and daytime rides on weekends\n") +
  theme(plot.title=element_text(size=18))
ggsave('hourandrental.png')
p_temp <- ggplot(train, aes(x=times, y=atemp, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Hour of the Day") +
  scale_x_datetime(breaks = date_breaks("4 hours"), labels=date_format("%I:%M %p")) + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("Temperature on Weekdays and WeekEnds\n") +
  theme(plot.title=element_text(size=18))
ggsave('temp.png')
p_humidity <- ggplot(train, aes(x=times, y=humidity, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Hour of the Day") +
  scale_x_datetime(breaks = date_breaks("4 hours"), labels=date_format("%I:%M %p")) + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("Humidity on Weekends and Weekdays\n") +
  theme(plot.title=element_text(size=18))
ggsave('humidityvsrental.png')
p_windspeed <- ggplot(train, aes(x=times, y=windspeed, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Hour of the Day") +
  scale_x_datetime(breaks = date_breaks("4 hours"), labels=date_format("%I:%M %p")) + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("Windspeed on weekends and weekdays\n") +
  theme(plot.title=element_text(size=18))
ggsave('winspeedvsrental.png')
p_temp_rental <- ggplot(train, aes(x=atemp, y=count, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Temperature") + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("Temperature vs Number of Bike Rentals\n") +
  theme(plot.title=element_text(size=18))
ggsave('tempvsrent.png')
p_humid_rental <- ggplot(train, aes(x=humidity, y=count, color=day)) +
  geom_smooth(fill=NA, size=1) +
  theme_light(base_size=20) +
  xlab("Humidity") + 
  ylab("Number of Bike Rentals") +
  scale_color_discrete("") +
  ggtitle("Humidity vs Number of Bike Rentals\n") +
  theme(plot.title=element_text(size=18))
ggsave('humidityvsrental.png')








