plotData <- "~/Desktop/Coursera/Exploratory/household_power_consumption.txt"
Data <- read.table(plotData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DateData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(DateData$Date, DateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(DateData$Global_active_power)

subMetering1 <- as.numeric(DateData$Sub_metering_1)
subMetering2 <- as.numeric(DateData$Sub_metering_2)
subMetering3 <- as.numeric(DateData$Sub_metering_3)

voltage <- as.numeric(DateData$Voltage)

GlobalReactivePower <- as.numeric(DateData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")


plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


