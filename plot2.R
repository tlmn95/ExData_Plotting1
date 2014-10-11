## Reading data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 nrows=2075259, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## Converting date and time variables
date_and_time <- paste(data$Date, data$Time)
data$Date_and_time <- strptime(date_and_time, format = "%Y-%m-%d %H:%M:%S")

##Open pgn file
png(filename = "plot2.png", height = 480, width = 480)

## Plot 2
plot(data$Date_and_time, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Close device
dev.off()