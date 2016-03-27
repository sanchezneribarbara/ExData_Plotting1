#read and open file
household_power <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header =TRUE, na.strings="?")



#subset data with correct date

household_power_n <- subset(household_power, Date == "1/2/2007" | Date =="2/2/2007")

household_power_n$DateTime <- strptime(paste(household_power_n$Date,household_power_n$Time),"%d/%m/%Y %H:%M:%S")


png(file = "plot2.png", width = 480, height = 480 )


plot(household_power_n$DateTime, household_power_n$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")

dev.off()



#turning of device
dev.off()