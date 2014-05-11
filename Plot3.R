fileLocation <- "exdata-data-household_power_consumption\\household_power_consumption.txt"
data <- read.table(fileLocation, header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
cleanData = subset(data, as.Date(data$Date) == "2007-02-01" | as.Date(data$Date) == "2007-02-02")
png("plot2.png")
plot(cleanData$DateTime,cleanData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
