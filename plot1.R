#Plot 1

#data prep

#read in file
hpc<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#select the 2 dates
hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

#Date format
hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")

summary(hpc.1)

#plot1

hist(hpc1$Global_active_power, col = 'red', main = 'Global Active Power',xlab = 'Global Active Power (Kilowatts)')






