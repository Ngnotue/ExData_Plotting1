#. Plot4

#. DataSite

dataSite  <- "C:/Users/Ngnotue.Noguem/Desktop/Capstone/household_power_consumption.txt"

#. We read and tidy the data 

data <- read.table(dataSite, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#. we filter the data for the time 2007-02-01 and 2007-02-02

dataFilter <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#. we convert the time representation

dateTime <- strptime(paste(dataFilter$Date, dataFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#. we convert the data to a numeric vector 

globalActivePower <- as.numeric(dataFilter$Global_active_power)
sub_Metering_1 <- as.numeric(dataFilter$Sub_metering_1)
sub_Metering_2 <- as.numeric(dataFilter$Sub_metering_2)
sub_Metering_3 <- as.numeric(dataFilter$Sub_metering_3)
globalReactivePower <- as.numeric(dataFilter$Global_reactive_power)
voltage <- as.numeric(dataFilter$Voltage)

#. we are preparating the plot

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#. we plot this
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, sub_Metering_2, type="l", col="red")
lines(dateTime, sub_Metering_3, type="l", col="blue")
legend("topright", 
       col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "0",lty=, lwd=2.5)
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#. we close the data png

dev.off()
