
fileLocation <- "exdata-data-household_power_consumption\\household_power_consumption.txt"
data <- read.table(fileLocation, header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
cleanData = subset(data, as.Date(data$Date) == "2007-02-01" | as.Date(data$Date) == "2007-02-02")
png(filename = "plot1.png")
hist(cleanData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()