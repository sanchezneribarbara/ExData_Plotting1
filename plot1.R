#open file and read
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
png(file = "plot1.png", width = 480, height = 480 )

#1st global active power vs frequency red hist
hist(household_power_n$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6),breaks = 15)

                                                 
dev.off()
