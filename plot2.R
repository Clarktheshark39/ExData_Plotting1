plotData <- "~/Desktop/Coursera/Exploratory/household_power_consumption.txt"
Data <- read.table(plotData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DateData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(DateData$Date, DateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(DateData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()