plot4 <- function(filename){
  
  ##only a subset of the data is read to minimize the time needed
  data = read.table(filename, sep=";",na.strings = "?", header = TRUE, nrows = 70000)
  data = subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
  row.names(data)= 1:nrow(data)
  
  ##We create a new variable which stores the date in a POSIXlt format
  data$fulldate = paste(data$Date, data$Time)
  data$full=strptime(data$fulldate, "%d/%m/%Y %H:%M:%S")
  
  ##the plot is saved directly to a png file
  png(file="plot4.png")
  par(mfrow=c(2,2)) ## to set the panel size
  ##Each of the plota require one plot command
  ##plot1
  plot(data$full, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
  ##plot2
  plot(data$full, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  ##plot3
  plot(data$full, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(data$full, data$Sub_metering_1)
  lines(data$full, data$Sub_metering_2, col = "red")
  lines(data$full, data$Sub_metering_3, col = "blue")
  legend("topright", legend=colnames(data)[7:9], col = c("black","red","blue"), lwd = 1, bty ="n")
  ##plot4
  plot(data$full, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
  
}