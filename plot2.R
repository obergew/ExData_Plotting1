data<- read.table("C:/Users/Erik/Documents/Coursera/Course4/household_power_consumption.txt",header = TRUE, sep=";")
data$Date <-as.Date(data$Date,format='%d/%m/%Y')
data<-subset(data, data$Date>= '2007-02-01'& data$Date<='2007-02-02')
data<- droplevels(data)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="C:/Users/Erik/Documents/Coursera/Course4/plot2.png")
plot(data$DateTime, data$Global_active_power,xlab="", ylab="Global active power (kilowatts)", type = "l")
dev.off()

