data<-read.csv("household_power_consumption.txt",na.strings="?",sep=";")
fechas<-data$Date
fechas<-as.Date(fechas,"%d/%m/%Y")
data$Date<-fechas
data_filtered<-subset(data,Date == '2007-02-01' | Date == '2007-02-02')
with(data_filtered,hist(Global_active_power,col="red",main="Global Active Power",xlab="Gloabl Active Power (Kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()
