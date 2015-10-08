# Read in all data
household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";",
                                        stringsAsFactors = FALSE)

# Convert values in the first column into a Date format 
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

# Create logical filter to subset data
use <- household_power_consumption$Date=="2007-02-01" | 
    household_power_consumption$Date=="2007-02-02"
# Subset data to the required period
data <- household_power_consumption[use,]

# Add date-time attribute
data$DateTime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

# Open PNG file
png(file = "plot4.PNG", width = 480, height = 480)

# Set multiple plot parameter: 2x2 plot grid
par(mfrow = c(2,2))

# Create plots
# (1,1)
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# (1,2)
plot(data$DateTime, data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

# (2,1)
plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), bty="n")

# (2,2)
plot(data$DateTime, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Close file
dev.off()
