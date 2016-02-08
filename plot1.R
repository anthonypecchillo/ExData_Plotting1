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
## Creates a png graphics device, fills it with the appropriate histogram, then closes the device.
##------------------------------------------------------------------------------------------

png(filename = "plot1.png", width = 480, height = 480)
hist(GlobalActivePower, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, 
     ylim = c(0, 1200))
dev.off()