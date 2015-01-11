#--------------------------------------------------------------------
# This is a R script to read .txt file for the Exploratory data analysis course on coursera
# The working directory has been set to the directory where the .txt file is downloaded
# Assignment # 1
# Author: Virendra
# Date: 01/10/2015
#--------------------------------------------------------------------
# The data is stored in the folder:
# C:\Users\Virendra\Documents\Exploratory_data_analysis\exdata_data_household_power_consumption
# The name of the file is:
# household_power_consumption.txt
#--------------------------------------------------------------------
#--------------------------------------------------------------------

#Script Begins...

# Read the data
name_of_the_file_to_read<-"household_power_consumption.txt"
data_all <- read.table(name_of_the_file_to_read,na.strings="?",header=TRUE,sep=";",as.is=TRUE)

# Strip the data between 01/02/2007 and 02/02/2007
data_in_the_required_date_range<-data_all[data_all$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert to Date and Time using strptime function
datetime <- strptime(paste(data_in_the_required_date_range$Date, data_in_the_required_date_range$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Get the Variables for plotting
global_active_power<-data_in_the_required_date_range$Global_active_power
global_reactive_power<-data_in_the_required_date_range$Global_reactive_power
SubMetering_1<-data_in_the_required_date_range$Sub_metering_1
SubMetering_2<-data_in_the_required_date_range$Sub_metering_2
SubMetering_3<-data_in_the_required_date_range$Sub_metering_3
Voltage<-data_in_the_required_date_range$Voltage

#Test the output before printing to png
par(mfrow = c(2, 2))
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power",cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering_2, type="l", col="red")
lines(datetime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(datetime, global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")

#Print to png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power",cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering_2, type="l", col="red")
lines(datetime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(datetime, global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")
dev.off()

#--------------------------------------------------------------------
# End of Script
#--------------------------------------------------------------------

