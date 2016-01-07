rm(list=ls())
#unzip("exdata_data_household_power_consumption.zip")  # remova front hashtag if current directory only has zipped datafile
eldata<-read.csv2("household_power_consumption.txt", sep = ";", dec = ".", header = FALSE, skip=66637, nrows = 2880)
colnam<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(eldata)<-colnam
ddate<-as.Date(eldata$Date, "%d/%m/%Y")
eldata$Date<-ddate
rm(colnam, ddate)
png(filename = "plot1.png", width = 480, height = 480)
hist(eldata$Global_active_power, breaks=12, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()