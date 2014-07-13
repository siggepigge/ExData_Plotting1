data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings="?")

d2d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] # Our two days extracted
d2d[2] <- as.POSIXct(strptime(paste(d2d$Date, d2d$Time), "%d/%m/%Y %H:%M:%S")) # Merge date and time in Time column in datetime format
d2d[3] <- as.numeric(as.character(d2d$Global_active_power))
d2d[4] <- as.numeric(as.character(d2d$Global_reactive_power))
d2d[5] <- as.numeric(as.character(d2d$Voltage))
d2d[6] <- as.numeric(as.character(d2d$Global_intensity))
d2d[7] <- as.numeric(as.character(d2d$Sub_metering_1))
d2d[8] <- as.numeric(as.character(d2d$Sub_metering_2))
d2d[9] <- as.numeric(as.character(d2d$Sub_metering_3))


png(filename = "plot2.png", width = 480, height = 480)
with(d2d,plot(
  Time,
  Global_active_power,
  type="l",
  ylab = "Global Active Power (kilowatts)",xlab=""))

dev.off()
