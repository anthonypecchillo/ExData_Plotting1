##------------------------------------------------------------------------------------------
## This file reads in our large data file, stores the data as a table, subsets it to a
## specific range of dates, and stores relevant data within the subset to convenient 
## variable names for plotting later.
##------------------------------------------------------------------------------------------

##------------------------------------------------------------------------------------------
## Reads data from file into a table named 'data'.
##------------------------------------------------------------------------------------------
file <- "~/Desktop/Coursera/Exploratory_Data_Analysis/Project_1/data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", 
                   colClasses = c("character", "character", rep("numeric", 7)), na = "?")

##------------------------------------------------------------------------------------------
## Creates a subset of data for the relevant dates only.
##------------------------------------------------------------------------------------------

relevant_dates <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##------------------------------------------------------------------------------------------
## Stores relevant data within subset to shorter variable names.
##------------------------------------------------------------------------------------------

date_time <- strptime(paste(relevant_dates$Date, relevant_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(relevant_dates$Global_active_power)
Voltage <- as.numeric(relevant_dates$Voltage)
SubMetering1 <- as.numeric(relevant_dates$Sub_metering_1)
SubMetering2 <- as.numeric(relevant_dates$Sub_metering_2)
SubMetering3 <- as.numeric(relevant_dates$Sub_metering_3)
GlobalReactivePower <- as.numeric(relevant_dates$Global_reactive_power)