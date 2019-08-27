#. Plot2

#. DataSite

dataSite  <- "C:/Users/Ngnotue.Noguem/Desktop/Capstone/household_power_consumption.txt"

#. We read and tidy the data 

data <- read.table(dataSite, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#. we filter the data for the time 2007-02-01 and 2007-02-02

dataFilter <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#. we convert the time representation

dateTime <- strptime(paste(dataFilter$Date, dataFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#. we convert the Global_active_power to a numeric vector 

globalActivePower <- as.numeric(dataFilter$Global_active_power)

#. we are preparating the plot

png("plot2.png", width=480, height=480)

#. the plot of globalerActiverPower 

plot(dateTime, globalActivePower,  type="l", xlab="", ylab="Global Active Power (kilowatts)")

#. we close the data png

dev.off()
