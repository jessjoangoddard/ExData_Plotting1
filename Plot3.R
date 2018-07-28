# --
# title: "EDA Coursera - HW1 - Plot 3"
# author: "Jess Goddard"
# date: "7/28/2018"
# --

# Import Data & Clean
# Read in Electric power consumption data as txt 
power_data <- read.csv2("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Format date for subsetting
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

# Subset data for 2007-02-01 and 2007-02-02
power_subset <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

# Date-Time column combing date and time inputs
power_subset$datetime <- paste0(power_subset$Date, power_subset$Time)
power_subset$datetime <- as.POSIXlt(power_subset$datetime)

# Sub metering data as numeric
power_subset$Sub_metering_1 <- as.numeric(power_subset$Sub_metering_1, na.rm = TRUE)
power_subset$Sub_metering_2 <- as.numeric(power_subset$Sub_metering_2, na.rm = TRUE)
power_subset$Sub_metering_3 <- as.numeric(power_subset$Sub_metering_3, na.rm = TRUE)

# Sub Metering Plots
png(filename = "Plot3.png", width = 480, height = 480)
plot(x = power_subset$datetime, y = power_subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x = power_subset$datetime, y = power_subset$Sub_metering_2, col = "red")
lines(x = power_subset$datetime, y = power_subset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2), col = c("black", "red", "blue"))
dev.off()