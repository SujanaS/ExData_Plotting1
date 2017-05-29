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

#Creating Plot3
plot(Power$Datetime,Power$Global_active_power,ylab = "Global Active Power(kilowatts)",type="l",xlab="")
with(Power,lines(Power$Datetime,Power$Sub_metering_2,col="Red"))
with(Power,lines(Power$Datetime,Power$Sub_metering_3,col="Blue"))

#Adding legend
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copying to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
