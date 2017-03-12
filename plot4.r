data<-read.csv("household_power_consumption.txt",na.strings="?",sep=";")
fechas<-data$Date
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$fechas<-fechas
data_filtered<-subset(data,Date == '2007-02-01' | Date == '2007-02-02')
data_filtered$time_m <- strptime(paste(data_filtered$fechas, data_filtered$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")
par(mfrow=c(2,2))

plot(x = data_filtered$time_m, y = data_filtered$Global_active_power,
     ylab = "Global Active Power",  type="l", xlab = "")
axis(1, at=1:3, lab=c("Thu","Fri", "Sat"))

plot(data_filtered$time_m,data_filtered$Voltage,xlab="datetime",ylab="Voltage",type="l")
axis(1, at=1:3, lab=c("Thu","Fri", "Sat"))

plot(x = data_filtered$time_m, y = data_filtered$Sub_metering_1,
    ylab = "Energy sub metering",  type="l", xlab = "", col = "black")
axis(1, at=1:3, labels =c("Thu","Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2)
lines(data_filtered$time_m, data_filtered$Sub_metering_2, col = "red")
lines(data_filtered$time_m, data_filtered$Sub_metering_3, col = "blue")

plot(x = data_filtered$time_m, y = data_filtered$Global_reactive_power,
     ylab = "Global Reactive Power",  type="l", xlab = "")
axis(1, at=1:3, lab=c("Thu","Fri", "Sat"))
dev.off()
