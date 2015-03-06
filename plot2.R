fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
tidyData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007", ]
tidyData$DateTime <- strptime(paste(tidyData$Date, tidyData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

with(tidyData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
