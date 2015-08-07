### read data into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 69516, stringsAsFactors = FALSE)

### subset data to dates we are interested in 
powerdata<- data[66637:69516, ]

### transform date and time data
powerdata$Date<- as.Date(powerdata$Date, format = "%d/%m/%Y")
date_time<- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Date_Time<- as.POSIXct(date_time)

### script to represent data in line graph and save as a png file
with(powerdata, plot(Global_active_power ~ Date_Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
