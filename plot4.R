### read data into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 69516, stringsAsFactors = FALSE)

### subset data to dates we are interested in
powerdata<- data[66636:69516, ]

### transform date and time columns
powerdata$Date<- as.Date(powerdata$Date, format = "%d/%m/%Y")
date_time<- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Date_Time<- as.POSIXct(date_time)

### script to graphically represent selected data and save as png file
par(mfrow = c(2,2), mar = c(4,4,1,1), oma = c(2,1,2,1), cex = .6)
with(powerdata, {
        plot(Global_active_power ~ Date_Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(Voltage~Date_Time, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Date_Time, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ Date_Time, col = "red")
        lines(Sub_metering_3 ~ Date_Time, col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "o")
        plot(Global_reactive_power~Date_Time, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
