
hld_data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE) #FILE IS READ HERE

str(hld_data)

#=======================================================================

#Need to convert the column date to date format
hld_data$Date <- as.Date(hld_data$Date, format="%d/%m/%Y") #DATE IS CONVERTED HERE

#=======================================================================
#subseting the data for selected days required in the project

hld_dataSample <- subset(hld_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))  
# SAMPLING FROM THE MAIN DATAFRAME

#=======================================================================

#A column with Date/Times is generated

DateTime <- paste(as.Date(hld_dataSample$Date), hld_dataSample$Time) # A vector is created usign Date and Time from the DataFrame
hld_dataSample$DateTime <- as.POSIXct(DateTime) # The converted DateTime is added to the original DataFrame with the proper format.  This is used widely in Plot 2, 3 and 4

#=======================================================================

#Plotting the plots in same plot window
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hld_dataSample, {
    plot(Global_active_power~DateTime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~DateTime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~DateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})


#Save the time based Plot to a file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()