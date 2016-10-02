
# R CMD BATCH plot4.R

# Data
# Path to Electric power consumption data file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
data_path <- "../household_power_consumption.txt"
data <- subset(read.csv(data_path, na.strings = "?", sep=";"), Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")


# Plot
png(filename = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(data, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab="")
  
  plot(DateTime, Voltage, type = "l", xlab="")
  
  plot(DateTime, Sub_metering_1, type = "n", ylab = "Watt-hour of active energy", xlab="", main="Energy Sub Metering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.9)
  
  plot(DateTime, Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab="")
})

dev.off()