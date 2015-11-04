#import db
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")

#format date column so that as.Date will work.
data$Date <- strptime(as.character(data$Date),"%d/%m/%Y")
data$Date <- as.Date(data$Date)

#select right rows
data1 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


#create histogram
hist(as.numeric(as.character(data1$Global_active_power)),col="red", breaks = 20,main="Global Active Power", xlab="Global Active Power (kW)")

#save it
dev.copy(png,'plot1.png')
dev.off()

