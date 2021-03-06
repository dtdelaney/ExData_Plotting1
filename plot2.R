#Plot2.r for Exploratory Data Analysis Project 1

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

# Construct plot2.png
png("plot2.png", height=480, width=480)

plot(hpcNew$DateTime, 
     hpcNew$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(hpcNew$DateTime, hpcNew$Global_active_power)

dev.off()