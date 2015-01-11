#Code to plot Line graph of Global Active Power from 02/01 to 02/02, 2012.
#Code considers that the file "household_power_consumption.txt" is in your working
#directory before sourcing.

#Read the original file for subsetting
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert data and time colums to correct format
file$Time <- strptime(paste(file$Date, file$Time), "%d/%m/%Y %H:%M:%S")
file$Date <- as.Date(as.character(file$Date),format="%d/%m/%Y")


#Subset the data over the required dates
data <- subset(file, Date == "2007-02-01" | Date == "2007-02-02")

#Open png file for plot
png(filename = "Plot4.png", width =480, height = 480,  bg = "transparent")

#Making space for the graphs
par(mfrow = c(2,2))

#Plot the grpahs
plot(data$Time, data$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

plot(data$Time, data$Voltage, type="l", ylab = "Voltage", xlab="datetime", lwd=0.05)

plot(data$Time, data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
points(data$Time, data$Sub_metering_1, col = "black", type="l")
points(data$Time, data$Sub_metering_2, col = "red", type="l")
points(data$Time, data$Sub_metering_3, col = "blue", type="l")
#Add Legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col =c("black","red","blue"), bty="n", lty = c(1,1,1))

plot(data$Time, data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime", lwd=0.05)
#Turn the conn off..
dev.off()