setwd("D:/data science course complete/Exploraty data analysis/project1")


hld_data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE) #FILE IS READ HERE

str(hld_data)

#saving the plot with the appropriate name
png(filename='plot1.png')

#creating the plot
with(hld_data,hist(hld_data$Global_active_power,breaks=11,xlab="Global Active Power(kilowatts)",col="green",main='Global Active Power'))

plot1<-hist(hld_data$Global_active_power,breaks=11,xlab="Global Active Power(kilowatts)",col="green",main='Global Active Power')
dev.off()