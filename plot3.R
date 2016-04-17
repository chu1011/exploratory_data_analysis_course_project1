###Exploratory Data Analysis assignment course_project1 plot3###

setwd("C:/Users/Hiroshi Ikeda/Desktop/Assignment1")

#load data
power_cons_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#select only 20070201-0202 data
power_cons_data_2days <- subset(power_cons_data, Date=="1/2/2007" | Date=="2/2/2007")

#combine date and time
datetime <- strptime(paste(power_cons_data_2days$Date, power_cons_data_2days$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#convert Sub_metering as.numeric
SubMetering1 <- as.numeric(power_cons_data_2days$Sub_metering_1)
SubMetering2 <- as.numeric(power_cons_data_2days$Sub_metering_2)
SubMetering3 <- as.numeric(power_cons_data_2days$Sub_metering_3)

#plot3(plot of Energy sub metering)
plot(datetime, SubMetering1, type="l", ylab = "Energy sub metering", xlab = "")
lines(datetime, SubMetering2, type = "l", col = "red")
lines(datetime, SubMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#create png file
dev.copy(device = png, filename = 'plot3.png', width = 480, height = 480)
dev.off()