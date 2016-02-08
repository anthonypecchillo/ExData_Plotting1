##------------------------------------------------------------------------------------------
## Checks if file that loads data (loadthedata.R) is in the current working directory.
## If not, working directory is set to that which contains the file loadthedata.R
##------------------------------------------------------------------------------------------

if (!"loadthedata.R" %in% list.files()) {
  setwd("~/Desktop/Coursera/Exploratory_Data_Analysis/Project_1/")
}

##------------------------------------------------------------------------------------------
## Tells R to accept its input from the provided file (loadthedata.R)
##------------------------------------------------------------------------------------------

source("loadthedata.R")

##------------------------------------------------------------------------------------------
## Stores relevant numeric data to shorter variable names.
##------------------------------------------------------------------------------------------

GlobalActivePower <- as.numeric(relevant_dates$Global_active_power)
Voltage <- as.numeric(relevant_dates$Voltage)
SubMetering1 <- as.numeric(relevant_dates$Sub_metering_1)
SubMetering2 <- as.numeric(relevant_dates$Sub_metering_2)
SubMetering3 <- as.numeric(relevant_dates$Sub_metering_3)
GlobalReactivePower <- as.numeric(relevant_dates$Global_reactive_power)

##------------------------------------------------------------------------------------------
## Creates a 2x2 png graphics device, fills with appropriate plots, then closes the device.
##------------------------------------------------------------------------------------------

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

## Top-left: Global Active Power Plot
plot(date_time, GlobalActivePower, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Top-right: Voltage Plot
plot(date_time, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage" )

## Bottom-left: Sub Metering Plot
plot(date_time, SubMetering1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(date_time, SubMetering2, col = "red")
lines(date_time, SubMetering3, col = "blue")
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right: Global Reactive Power Plot
plot(date_time, GlobalReactivePower, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab="Global_reactive_power")

dev.off()