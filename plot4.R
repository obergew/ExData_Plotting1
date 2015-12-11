data<- read.table("C:/Users/Erik/Documents/Coursera/Course4/household_power_consumption.txt",header = TRUE, sep=";")
data$Date <-as.Date(data$Date,format='%d/%m/%Y')
data<-subset(data, data$Date>= '2007-02-01'& data$Date<='2007-02-02')
data<- droplevels(data)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power<-as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Voltage<-as.numeric(levels(data$Voltage))[data$Voltage]

data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
head(data)
yrange<-range(c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
png(filename="C:/Users/Erik/Documents/Coursera/Course4/plot4.png")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power,xlab="", ylab="Global active power (kilowatts)", type = "l")
plot(data$DateTime, data$Voltage,xlab="", ylab="Voltage", type = "l")
plot(data$DateTime, data$Sub_metering_1, type="l", col="black", 
     ylim=yrange, axes=T, ann=T, xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", 
      col="red")
lines(data$DateTime, data$Sub_metering_3, type="l",
      col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), 
       lty=1, lwd=1, bty="n")
plot(data$DateTime, data$Global_reactive_power,xlab="", ylab="Global_reactive_power", type = "l")
dev.off()
