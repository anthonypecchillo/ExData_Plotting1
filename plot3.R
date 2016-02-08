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
SubMetering1 <- as.numeric(relevant_dates$Sub_metering_1)
SubMetering2 <- as.numeric(relevant_dates$Sub_metering_2)
SubMetering3 <- as.numeric(relevant_dates$Sub_metering_3)

##------------------------------------------------------------------------------------------
## Creates a png graphics device, fills it with the appropriate plot, then closes the device.
##------------------------------------------------------------------------------------------

png(filename = "plot3.png", width = 480, height = 480)
plot(date_time, SubMetering1, 
     type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(date_time, SubMetering2, col = "red")
lines(date_time, SubMetering3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()
