plot1 <- function(filename){
  
  ##only a subset of the data is read to minimize the time needed
  data = read.table(filename, sep=";",na.strings = "?", header = TRUE, nrows = 70000)
  data = subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
  row.names(data)= 1:nrow(data)
  
  ##the plot is saved directly to a png file
  png(file="plot1.png")
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}