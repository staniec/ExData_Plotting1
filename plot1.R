
# R CMD BATCH plot1.R

# Data
# Path to Electric power consumption data file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
data_path <- "../household_power_consumption.txt"
data <- subset(read.csv(data_path, na.strings = "?", sep=";"), Date == "1/2/2007" | Date == "2/2/2007")

# Plot
png(filename = "plot1.png", height = 480, width = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()