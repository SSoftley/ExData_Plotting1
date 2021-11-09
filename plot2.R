#Load and format data
library(sqldf)
query_string <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007' "
DF<-read.csv.sql(file="household_power_consumption.txt", sep=";", sql = query_string)


library(lubridate)
DF$Date<-dmy(DF$Date)
DF$Time<-ymd_hms(paste(DF$Date,DF$Time))

#Plot 2
png(filename="plot2.png", width=480, height=480)

plot(DF$Time, DF$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

