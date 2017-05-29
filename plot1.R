# Unzip dataSet to /data directory
unzip(zipfile="./household_power_consumption.zip",exdir="./data")

#Reading Data from text file
Elec_power_full <- read.table("./household_power_consumption.txt",header = T,sep=";",na.strings = "?")

#Converting Date and Time columns
Elec_power_full$Date<-as.Date(Elec_power_full$Date,format="%d/%m/%Y")
Elec_power_full$Time<-strptime(Elec_power_full$Time,format = "%H:%M:%S")

#Subsetting data for specific dates
Power<-subset(Elec_power_full,Elec_power_full$Date=="2007-02-01"|Elec_power_full$Date=="2007-02-02")

#Creating Histogram Plot1
hist(Power$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col = "red")

#Copying to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
