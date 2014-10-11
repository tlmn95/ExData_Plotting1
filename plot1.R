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
png(filename = "plot1.png", height = 480, width = 480)

## Plot 1
hist(data$Global_active_power, main = "Global Active Power", 
     ylab = "Frequency", xlab = "Global_active_power (kilowatts)", col = "red")

##Close device
dev.off()