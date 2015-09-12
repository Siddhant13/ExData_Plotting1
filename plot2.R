plot2 <- function(filename){
  
  ##only a subset of the data is read to minimize the time needed
  data = read.table(filename, sep=";",na.strings = "?", header = TRUE, nrows = 70000)
  data = subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
  row.names(data)= 1:nrow(data)
  
  ##We create a new variable which stores the date in a POSIXlt format
  data$fulldate = paste(data$Date, data$Time)
  data$full=strptime(data$fulldate, "%d/%m/%Y %H:%M:%S")
  
  ##the plot is saved directly to a png file
  png(file="plot2.png")
  plot(data$full, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
  dev.off()
}