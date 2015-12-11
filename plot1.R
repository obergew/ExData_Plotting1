
data<- read.table("C:/Users/Erik/Documents/Coursera/Course4/household_power_consumption.txt",header = TRUE, sep=";")
data$Date <-as.Date(data$Date,format='%d/%m/%Y')
data<-subset(data, data$Date>= '2007-02-01'& data$Date<='2007-02-02')
data<- droplevels(data)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]

png(filename="C:/Users/Erik/Documents/Coursera/Course4/plot1.png")
hist(data$Global_active_power, main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)",ylab=("Frequency"), ylim=c(0,1200))
dev.off()