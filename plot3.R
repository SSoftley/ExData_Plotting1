#Load and format data
library(sqldf)
query_string <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007' "
DF<-read.csv.sql(file="household_power_consumption.txt", sep=";", sql = query_string)


library(lubridate)
DF$Date<-dmy(DF$Date)
DF$Time<-ymd_hms(paste(DF$Date,DF$Time))

#Plot 3

png(filename="plot3.png", width=480, height=480)

plot(DF$Time, DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DF$Time, DF$Sub_metering_2, type="l", xlab="", col="red")
lines(DF$Time, DF$Sub_metering_3, type="l", xlab="", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=1)

dev.off()
