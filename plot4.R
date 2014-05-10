#Plot4.r for Exploratory Data Analysis Project 1

#Read data into R
hpc <- read.table("household_power_consumption.txt", sep=";", header=T, 
                  #cooerce column classes and acknowledge missing values
                  colClasses=c('character', 'character', 'numeric',
                               'numeric', 'numeric', 'numeric',
                               'numeric', 'numeric', 'numeric'),
                  na.strings='?')

#convert the Date and Time variables to Date/Time classes
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

#subset the dates 2007-02-01 and 2007-02-02
hpcNew <- subset(hpc, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

# Construct plot4.png
png("plot4.png", height=480, width=480)

# Create 2x2 plots
par(mfrow=c(2,2))

# Global Active Power plot
plot(hpcNew$DateTime, 
     hpcNew$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(hpcNew$DateTime, hpcNew$Global_active_power)

# Voltage plot
plot(hpcNew$DateTime, hpcNew$Voltage, 
     ylab="Voltage", 
     xlab="datetime", 
     pch=NA)
lines(hpcNew$DateTime, hpcNew$Voltage)

# Submetering plot
plot(hpcNew$DateTime, 
     hpcNew$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(hpcNew$DateTime, hpcNew$Sub_metering_1)
lines(hpcNew$DateTime, hpcNew$Sub_metering_2, col='red')
lines(hpcNew$DateTime, hpcNew$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Global reactive power plot
with(hpcNew, 
     plot(DateTime, Global_reactive_power, 
                  xlab='datetime', 
                  pch=NA))
with(hpcNew, 
     lines(DateTime, Global_reactive_power))

dev.off()