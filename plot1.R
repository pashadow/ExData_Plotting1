fullData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
tidyData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007", ]

png(file = "plot1.png")

hist(tidyData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
