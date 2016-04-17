###Exploratory Data Analysis assignment course_project1 plot2###

setwd("C:/Users/Hiroshi Ikeda/Desktop/Assignment1")

#load data
power_cons_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", dec = ".")

#convert date as.Date
power_cons_data$Date <- as.Date(power_cons_data$Date, format = "%d/%m/%Y")

#select only 20070201-0202 data
power_cons_data_2days <- subset(power_cons_data, Date>="2007-2-1" & Date<="2007-2-2")

#combine date and time
datetime <- paste(power_cons_data_2days$Date, power_cons_data_2days$Time)
power_cons_data_2days <- cbind(power_cons_data_2days, datetime)
power_cons_data_2days$datetime <- as.POSIXct(power_cons_data_2days$datetime)

#convert time to POSIXlt
power_cons_data_2days$Time <- strptime(power_cons_data_2days$Time, format = "%H:%M:%S")

#plot2(plot)
plot(power_cons_data_2days$Global_active_power~power_cons_data_2days$datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

#create png file
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480)
dev.off()