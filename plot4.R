# Unzip dataSet to /data directory
unzip(zipfile="./household_power_consumption.zip",exdir="./data")

#Reading Data from text file
Elec_power_full <- read.table("./household_power_consumption.txt",header = T,sep=";",na.strings = "?")

#Converting Date and Time columns
Elec_power_full$Date<-as.Date(Elec_power_full$Date,format="%d/%m/%Y")

#Subsetting data for specific dates
Power<-subset(Elec_power_full,Elec_power_full$Date=="2007-02-01"|Elec_power_full$Date=="2007-02-02")

#Clubbing Date and time
Datetime<-paste(Power$Date,Power$Time)
Power$Datetime<-as.POSIXct(Datetime)

#Creating Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Power, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


#Copying to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
