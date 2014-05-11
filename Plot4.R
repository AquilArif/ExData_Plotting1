fileLocation <- "exdata-data-household_power_consumption\\household_power_consumption.txt"
data <- read.table(fileLocation, header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
cleanData = subset(data, as.Date(data$Date) == "2007-02-01" | as.Date(data$Date) == "2007-02-02")

png("plot4.png",width=800,height=800)

par(mfrow=c(2,2))

plot(cleanData$DateTime,cleanData$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(cleanData$DateTime,cleanData$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(cleanData$DateTime,cleanData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(cleanData$DateTime,cleanData$Sub_metering_1,type="l")
lines(cleanData$DateTime,cleanData$Sub_metering_2,type="l",col="red")
lines(cleanData$DateTime,cleanData$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

plot(cleanData$DateTime,cleanData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
