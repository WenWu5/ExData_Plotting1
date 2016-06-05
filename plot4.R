setwd("C:/Users/Wen/WorkingDirectory/Coursera/ExploratoryDataAnalysis/Week1")
zippedfileName <- "./data/household_power_consumption.zip"
unzippedFileName <- "./data/household_power_consumption.txt"
downloadPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

###downloading data####

if ( !file.exists(unzippedFileName)) {
  download.file(downloadPath, destfile = zippedfileName)
  
  ###Unzipping folder###
  unzip(zippedfileName, exdir = "./data")
}

ds <- read.csv(unzippedFileName, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")
ds <- subset(ds, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

###Adding date time###
ds$DateTime <- as.POSIXct(paste(as.Date(ds$Date), ds$Time))


###Plotting###
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(ds$DateTime, ds$Global_active_power, type = "l", col = "green", ylab = "Global Active Power", xlab = "")
plot(ds$DateTime, ds$Voltage, type = "l", col = "orange", ylab = "Voltage", xlab = "datetime")
plot(ds$Sub_metering_1 ~ ds$DateTime, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(ds$Sub_metering_2 ~ ds$DateTime, col = "Red")
lines(ds$Sub_metering_3 ~ ds$DateTime, col = "Blue")
legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(ds$DateTime, ds$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.off()

par(mfrow = c(2,2))
plot(ds$DateTime, ds$Global_active_power, type = "l", col = "green", ylab = "Global Active Power", xlab = "")
plot(ds$DateTime, ds$Voltage, type = "l", col = "orange", ylab = "Voltage", xlab = "datetime")
plot(ds$Sub_metering_1 ~ ds$DateTime, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(ds$Sub_metering_2 ~ ds$DateTime, col = "Red")
lines(ds$Sub_metering_3 ~ ds$DateTime, col = "Blue")
legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(ds$DateTime, ds$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")



