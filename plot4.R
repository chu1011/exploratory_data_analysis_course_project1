###Exploratory Data Analysis assignment course_project1 plot4###

setwd("C:/Users/Hiroshi Ikeda/Desktop/Assignment1")

#load data
power_cons_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#select only 20070201-0202 data
power_cons_data_2days <- subset(power_cons_data, Date=="1/2/2007" | Date=="2/2/2007")

#convert date as.Date
power_cons_data_2days$Date <- as.Date(power_cons_data_2days$Date, format = "%d/%m/%Y")

#combine date and time
dateandtime <- paste(power_cons_data_2days$Date, power_cons_data_2days$Time)
power_cons_data_2days <- cbind(power_cons_data_2days, dateandtime)
power_cons_data_2days$dateandtime <- as.POSIXct(power_cons_data_2days$dateandtime)

#convert time to POSIXlt
power_cons_data_2days$Time <- strptime(power_cons_data_2days$Time, format = "%H:%M:%S")

#combine date and time in datatime
datetime <- strptime(paste(power_cons_data_2days$Date, power_cons_data_2days$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#convert Sub_metering as.numeric
SubMetering1 <- as.numeric(power_cons_data_2days$Sub_metering_1)
SubMetering2 <- as.numeric(power_cons_data_2days$Sub_metering_2)
SubMetering3 <- as.numeric(power_cons_data_2days$Sub_metering_3)

#convert as.numeric
power_cons_data_2days$Voltage <- as.numeric(power_cons_data_2days$Voltage)
power_cons_data_2days$Global_reactive_power <- as.numeric(power_cons_data_2days$Global_reactive_power)

#plot4(four plots)
par(mfrow = c(2,2))

#plot top left
plot(power_cons_data_2days$Global_active_power~power_cons_data_2days$dateandtime, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

#plot top right
plot(power_cons_data_2days$Voltage~power_cons_data_2days$dateandtime, type="l", ylab = "Voltage", xlab = "datetime")

#plot bottom left
plot(datetime, SubMetering1, type="l", ylab = "Energy sub metering", xlab = "")
lines(datetime, SubMetering2, type = "l", col = "red")
lines(datetime, SubMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot bottom right
plot(power_cons_data_2days$Global_reactive_power~power_cons_data_2days$dateandtime, type="l", ylab = "Global_reactive_power", xlab = "datetime")

#create png file
dev.copy(device = png, filename = 'plot4.png', width = 480, height = 480)
dev.off()