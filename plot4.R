#plot 4
#read in file
hpc<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#select the 2 dates
hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

#Date format
hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")

# create datetime
datetime <- paste(as.Date(hpc1$Date), hpc1$Time)

# format datetime
hpc1$datetime <- as.POSIXct(datetime)


#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc1, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})




