# read data from CSV file:
data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# convert "Date" and "Time" columns to R POSIX format:
data$Date<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# subset data to target dates 2007/02/01 and 2007/02/02:
data <- data[as.Date(data$Date)=="2007-02-01" | as.Date(data$Date)=="2007-02-02",]

# convert meter readings to numeric:
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


# open PNG device:
png(filename="plot4.png",width=480,height=480)

# create plot:
Sys.setlocale('LC_ALL', 'en_US')
par(mfrow=c(2,2))
# plot 1:
plot(data$Date,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# plot 2:
plot(data$Date,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
# plot 3:
plot(data$Date, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2,type="l",col="red")
lines(data$Date, data$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
# plot 4:
plot(data$Date,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# close PNG device:
dev.off()
