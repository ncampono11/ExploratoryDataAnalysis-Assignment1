#plot 2

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

summary(hpc1)

#plot2

with(hpc1, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


dev.copy(png, file="plot2.png", height=480, width=480)

