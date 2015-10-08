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

# Open PNG file
png(file = "plot1.PNG", width = 480, height = 480)

# Create plot 
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Close file
dev.off()
