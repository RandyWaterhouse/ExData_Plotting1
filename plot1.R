# read data from CSV file:
data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# convert "Date" column to R date format:
data$Date<-as.Date(strptime(data$Date,format="%d/%m/%Y"))

# subset data to target dates 2007/02/01 and 2007/02/02:
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

# convert "Global_active_power" to numeric:
data$Global_active_power <- as.numeric(data$Global_active_power)

# open PNG device:
png(filename="plot1.png",width=480,height=480)

# create histogram
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global active power")

# close PNG device:
dev.off()
