setwd("C:/Users/Kenneth/Documents/R/ExplDataAnalysis")
xx <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

library(lubridate)
xx$Date <- dmy(xx$Date)
xx$Time <- hms(xx$Time)
xx$Global_active_power <- as.numeric(as.character(xx$Global_active_power))
xx$Global_reactive_power <- as.numeric(as.character(xx$Global_reactive_power))
xx$Voltage <- as.numeric(as.character(xx$Voltage))
xx$Global_intensity <- as.numeric(as.character(xx$Global_intensity))
xx$Sub_metering_1 <- as.numeric(as.character(xx$Sub_metering_1))
xx$Sub_metering_2 <- as.numeric(as.character(xx$Sub_metering_2))

xx1 <- subset(xx, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))

png(filename="plot2.png")
plot(xx1$Date+xx1$Time, xx1$Global_active_power, type="l", xlab="", 
  ylab="Global Active Power (kilowatts)") 
dev.off()
