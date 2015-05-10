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

png(filename="plot3.png")
plot(xx1$Date+xx1$Time, xx1$Sub_metering_1, type="l", xlab="", 
  ylab="Energy sub metering", col="black")
lines(xx1$Date+xx1$Time, xx1$Sub_metering_2, type="l", col="red") 
lines(xx1$Date+xx1$Time, xx1$Sub_metering_3, type="l", col="blue") 
legend("topright", lty=c(1,1), lwd=c(2,2), col=c("black","red","blue"), 
  c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
