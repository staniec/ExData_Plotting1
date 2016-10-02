
# R CMD BATCH plot2.R

# Data
# Path to Electric power consumption data file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
data_path <- "../household_power_consumption.txt"
data <- subset(read.csv(data_path, na.strings = "?", sep=";"), Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")

# Plot
png(filename = "plot2.png", height = 480, width = 480)
with(data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()