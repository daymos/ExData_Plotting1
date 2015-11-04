
  data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")
  
  #format date column so that as.Date will work.
  data$Date <- strptime(as.character(data$Date),"%d/%m/%Y")
  data$Date <- as.Date(data$Date)
  
  #select right rows
  data1 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
  
  data1$timestamp <- as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")
  
  plot(data1$timestamp, as.numeric(as.character(data1$Sub_metering_1)),type="n", pch=".", ylab = "Global Active Power (kW)", xlab="" )
  
  lines(data1$timestamp,as.numeric(as.character(data1$Sub_metering_1)),col="red", type="o", pch=".")
  lines(data1$timestamp,as.numeric(as.character(data1$Sub_metering_2)),col="blue", type="o", pch=".")
  lines(data1$timestamp,as.numeric(as.character(data1$Sub_metering_3)),col="black", type="o", pch=".")
  
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("red","blue","black"), lwd = 1,cex = 0.5)
 
  
  #save it
  dev.copy(png,'plot3.png')
  dev.off()
  