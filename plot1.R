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

###Plotting And Saving as PNG###
png("plot1.png", width = 480, height = 480)
hist(ds$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

hist(ds$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
