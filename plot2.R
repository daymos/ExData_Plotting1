help(#import db
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")

#format date column so that as.Date will work.
data$Date <- strptime(as.character(data$Date),"%d/%m/%Y")
data$Date <- as.Date(data$Date)

#select right rows
data1 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

data1$timestamp <- as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")

plot(data1$timestamp, as.numeric(as.character(data1$Global_active_power)), type="o", pch=".", ylab = "Global Active Power (kW)", xlab="")

#save it
dev.copy(png,'plot2.png')
dev.off()
