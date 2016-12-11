household_power_consumption <- read.csv("~/Desktop/household_power_consumption.txt", header=T, sep=";", dec=".", stringsAsFactors = FALSE)
dataFeb<- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]
power<- as.numeric(dataFeb$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
