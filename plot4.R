data <- read.table('household_power_consumption.txt', sep=";", na.strings="?",skip=66637, nrows=2881)
datb <- cbind(data, date=strptime(paste(data$V1, data$V2),"%d/%m/%Y %T"))
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(datb, {
#First: from plot2.R
     plot(date, V3, "l", xlab='', ylab='Global Active Power (kilowatts)')
#Second
     plot(date, V5, "l", xlab='datetime', ylab='Voltage')
#Third: from plot3.R
     with(datb, {
	plot(date, V7, "l", xlab='', ylab='Energy sub metering')
  	lines(date, V8, col='red')
	lines(date, V9, col='blue')
	})
     legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border='white')
#Fourth
     plot(date, V4, "l", xlab='datetime', ylab='Global_reactive_power')
})
dev.copy(png, file='plot4.png')
dev.off()
