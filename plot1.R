#Load and format data
library(sqldf)
query_string <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007' "
DF<-read.csv.sql(file="household_power_consumption.txt", sep=";", sql = query_string)


library(lubridate)
DF$Date<-dmy(DF$Date)
DF$Time<-ymd_hms(paste(DF$Date,DF$Time))

#Plot 1
png(filename="plot1.png", width=480, height=480)
hist(DF$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png")
dev.off()

