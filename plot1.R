### read data into R
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 69516, stringsAsFactors = FALSE)

### subset data to include only the dates we are interested in
powerdata<- data[66637:69516, ]

### transform date and time columns
date_time<- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Date_Time<- as.POSIXct(date_time)

### script to plot data in historgram and save as a png file
with(powerdata, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
