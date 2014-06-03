# read data from CSV file:
data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# convert "Date" and "Time" columns to R POSIX format:
data$Date<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# subset data to target dates 2007/02/01 and 2007/02/02:
data <- data[as.Date(data$Date)=="2007-02-01" | as.Date(data$Date)=="2007-02-02",]

# convert "Global_active_power" to numeric:
data$Global_active_power <- as.numeric(data$Global_active_power)

# open PNG device:
png(filename="plot2.png",width=480,height=480)

# create plot:
Sys.setlocale('LC_ALL', 'en_US')
plot(data$Date,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# close PNG device:
dev.off()
