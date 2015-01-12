data <- read.table('household_power_consumption.txt', sep=";", na.strings="?",skip=66637, nrows=2881)
with(data,hist(V3,xlab='Global Active Power (kilowatts)', col='red', main='Global Active Power'))
dev.copy(png, file = "plot1.png")
dev.off()
