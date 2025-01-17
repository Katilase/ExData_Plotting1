household_power_consumption <- read.csv("~/Desktop/household_power_consumption.txt", header=T, sep=";", dec=".", stringsAsFactors = FALSE)
dataFeb<- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]
power<- as.numeric(dataFeb$Global_active_power)
daytime <- strptime(paste(dataFeb$Date, dataFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1<-as.numeric(dataFeb$Sub_metering_1)
Sub_metering_2<-as.numeric(dataFeb$Sub_metering_2)
Sub_metering_3<-as.numeric(dataFeb$Sub_metering_3)
reactive_power <- as.numeric(dataFeb$Global_reactive_power)
voltage <- as.numeric(dataFeb$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(daytime, power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(daytime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(daytime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(daytime, Sub_metering_2, type="l", col="red")
lines(daytime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(daytime, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
