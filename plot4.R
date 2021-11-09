#Load and format data
library(sqldf)
query_string <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007' "
DF<-read.csv.sql(file="household_power_consumption.txt", sep=";", sql = query_string)


library(lubridate)
DF$Date<-dmy(DF$Date)
DF$Time<-ymd_hms(paste(DF$Date,DF$Time))

#Plot 4

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#1
plot(DF$Time, DF$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#2
plot(DF$Time, DF$Voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(DF$Time, DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DF$Time, DF$Sub_metering_2, type="l", xlab="", col="red")
lines(DF$Time, DF$Sub_metering_3, type="l", xlab="", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=0.9, bty="n")
#4
plot(DF$Time, DF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
