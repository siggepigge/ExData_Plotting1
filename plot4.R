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


png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

with (d2d, {
  
  plot(Time,Global_active_power,
       type = "l",
       xlab = "",
       ylab = "Global Active Power")
  
  plot(
    Time,
    Sub_metering_1,
    type = "l",
    ylab = "Energy Sub Metering",
    xlab = "")
  lines(Time,
        Sub_metering_2,
        col = "red")
  lines(Time,
        Sub_metering_3,
        col = "blue")
  legend("topright",col = c("black","red","blue"),lty = "solid", border = "",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(Time, Voltage,
       type = "l",
       xlab = "",
       ylab = "Voltage")
  
  plot(Time,Global_reactive_power,
       type = "l",
       xlab = "",
       ylab = "Global Reactive Power")
})
dev.off()