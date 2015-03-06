fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
tidyData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007", ]
tidyData$DateTime <- strptime(paste(tidyData$Date, tidyData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2, 2))

with(tidyData, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(DateTime, Voltage, type = "l", xlab = "datetime")
  
  plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(DateTime, Sub_metering_1, type = "l", col = "black")
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
  
})

dev.off()
