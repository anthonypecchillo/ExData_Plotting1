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
## Stores relevant numeric data to variable GlobalActivePower.
##------------------------------------------------------------------------------------------

GlobalActivePower <- as.numeric(relevant_dates$Global_active_power)

##------------------------------------------------------------------------------------------
## Creates a png graphics device, fills it with the appropriate plot, then closes the device.
##------------------------------------------------------------------------------------------

png("plot2.png", width = 480, height = 480)
plot(date_time, GlobalActivePower, 
     type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()