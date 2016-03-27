#reading in data
household_power <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE,na.strings="?")

#subset data with correct date

household_power_n <- subset(household_power, Date == "1/2/2007" | Date =="2/2/2007")

household_power_n$DateTime <- strptime(paste(household_power_n$Date,household_power_n$Time),"%d/%m/%Y %H:%M:%S")


#Change columns into numeric and not factor
household_power_n$Global_active_power <- as.numeric(household_power_n$Global_active_power)
household_power_n$Global_reactive_power <- as.numeric(household_power_n$Global_reactive_power)
household_power_n$Voltage <- as.numeric(household_power_n$Voltage)
household_power_n$Global_intensity <- as.numeric(household_power_n$Global_intensity)
household_power_n$Sub_metering_1<- as.numeric(household_power_n$Sub_metering_1)
household_power_n$Sub_metering_2 <- as.numeric(household_power_n$Sub_metering_2)
household_power_n$Sub_metering_3 <- as.numeric(household_power_n$Sub_metering_3)

#open png device and make a certain size
png(file = "plot4.png", width = 480, height = 480 )

#Setting up for the four different plots
par(mfrow = c(2,2), mar = c(4,4,2,1))

#plot 1

plot(household_power_n$DateTime, household_power_n$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")


#plot 2
plot(household_power_n$DateTime, household_power_n$Voltage, xlab = "datetime", ylab="Voltage",type = "l")

#plot 3
plot(household_power_n$DateTime, household_power_n$Sub_metering_1, ylab = "Energy sub Meeting",type = "l")
lines(household_power_n$DateTime, household_power_n$Sub_metering_2, col = "red")
lines(household_power_n$DateTime, household_power_n$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(household_power_n$DateTime, household_power_n$Global_reactive_power, xlab = "datetime", type = "l", 
     ylab = "Global_reactive_power")


dev.off()
