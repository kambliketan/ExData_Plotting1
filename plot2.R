
power = read.table(file = "household_power_consumption.txt", na.strings = "?", sep = ";", header = T)

power$DateTime <- paste(power$Date, power$Time)
power$Date <- as.Date(as.character(power$Date), format = "%d/%m/%Y")
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

day1 <- strptime("2007-02-01 0:0:0", format = "%Y-%m-%d %H:%M:%S")
day2 <- strptime("2007-02-03 0:0:0", format = "%Y-%m-%d %H:%M:%S")

power_subset <- power[power$DateTime < day2 & power$DateTime >= day1,]

png(filename = "plot2.png", width = 480, height = 480)
plot(power_subset$DateTime, power_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
