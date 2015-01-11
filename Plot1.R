#Code to plot Line graph of Global Active Power from 02/01 to 02/02, 2012.
#Code considers that the file "household_power_consumption.txt" is in your working
#directory before sourcing.

#Read the original file for subsetting
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Conver data and time colums to correct format
file$Date <- as.Date(as.character(file$Date),format="%d/%m/%Y")

file$Time <- strptime(file$Time, format= "%H:%M:%S")

#Subset the data over the required dates
data <- subset(file, Date == "2007-02-01" | Date == "2007-02-02")

#Open png file for plot
png(filename = "Plot1.png", width =480, height = 480,  bg = "transparent")

#Plot the histogram
hist(data$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power(killowatts)")

#Turn the conn off..
dev.off()