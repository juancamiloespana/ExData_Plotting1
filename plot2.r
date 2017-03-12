data<-read.csv("household_power_consumption.txt",na.strings="?",sep=";")
fechas<-data$Date
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$fechas<-fechas
data_filtered<-subset(data,Date == '2007-02-01' | Date == '2007-02-02')
data_filtered$time_m <- strptime(paste(data_filtered$fechas, data_filtered$Time), "%d/%m/%Y %H:%M:%S")

plot(x = data_filtered$time_m, y = data_filtered$Global_active_power,
     ylab = "Global Active Power (kilowatts)",  type="l", xlab = "")
axis(1, at=1:3, lab=c("Thu","Fri", "Sat"))
