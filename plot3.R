### read data into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 69516, stringsAsFactors = FALSE)

### subset data to dates we are interested in
powerdata<- data[66636:69516, ]

### transform date and time columns
powerdata$Date<- as.Date(powerdata$Date, format = "%d/%m/%Y")
date_time<- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Date_Time<- as.POSIXct(date_time)

### graphically represent selected data and save as png file
par(cex = .7, oma = c(4,4,2,3))
with(powerdata, {
        plot(Sub_metering_1 ~ Date_Time, type = "l", xlab =    "", ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ Date_Time, col = "red")
        lines(Sub_metering_3 ~ Date_Time, col = "blue")
})
        legend("topright", legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd =1)
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
