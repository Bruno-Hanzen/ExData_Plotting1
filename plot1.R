# some initialisations
directory <-"Z:/Professionnel/Cours/R Code/Assignment 5"
outdirectory <-"Z:/Professionnel/Cours/repos/ExData_Plotting1"
zipfile <- "household_power_consumption.zip"
datafile <- "household_power_consumption.txt"
fullzip <-paste(directory,"/", zipfile, sep="")
fulldata <- paste(directory,"/", datafile, sep="")
plot1 <-paste(outdirectory,"/", "plot1.png", sep="")
plot2 <-paste(outdirectory,"/", "plot2.png", sep="")
plot3 <-paste(outdirectory,"/", "plot3.png", sep="")
plot4 <-paste(outdirectory,"/", "plot4.png", sep="")

library(data.table)
library(dtplyr)
library(dplyr)
# get zip from Internet
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", fullzip)
# unzip
unzip(fullzip, exdir=directory)
# read unzipped file
data<-fread(datafile, na.strings = "?")
# cast Date to date type 
data$Date<-as.Date(data$Date, "%d/%m/%Y")
# filter the requested dates
ShortData <- as.data.frame(filter(data, Date >="2007-02-01" & Date <= "2007-02-02"))
# cast Time as a time type
ShortData$Time <- as.POSIXct(strptime(paste(ShortData$Date, ShortData$Time), format="%Y-%m-%d %H:%M:%S"))
# plot 1
png(file=plot1)
hist(ShortData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
# # plot 2
# png(file=plot2)
# plot(ShortData$Time, ShortData$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
# dev.off()
# # plot 3
# png(file=plot3)
# with (ShortData, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="" ))
# with (ShortData, lines(Time, Sub_metering_1, col="black", type="l" ))
# with (ShortData, lines(Time, Sub_metering_2, col="red", type="l" ))
# with (ShortData, lines(Time, Sub_metering_3, col="blue", type="l" ))
# legend("topright", col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_", "Sub_metering_3"), lty=1)
# dev.off()
# # plot 4
# png(file=plot4)
# par (mfrow = c(2,2))
# # Sub plot 1
# plot(ShortData$Time, ShortData$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
# # Sub plot 2
# plot(ShortData$Time, ShortData$Voltage, type="l", ylab= "Voltage", xlab="datetime")
# # Sub plot 3
# with (ShortData, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="" ))
# with (ShortData, lines(Time, Sub_metering_1, col="black", type="l" ))
# with (ShortData, lines(Time, Sub_metering_2, col="red", type="l" ))
# with (ShortData, lines(Time, Sub_metering_3, col="blue", type="l" ))
# legend("topright", col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
# # Sub plot 4
# plot(ShortData$Time, ShortData$Global_reactive_power, type="l", ylab= "Global_reactive_power", xlab="datetime")
# dev.off()


