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
png(filename = "plot3_t.png", height = 480, width = 480)

## Plot 3
with(data, {
    plot(Date_and_time, Sub_metering_1, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Date_and_time, Sub_metering_2, type = "l", col = "red")
    lines(Date_and_time, Sub_metering_3, type = "l", col = "blue")
})

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))

##Close device
dev.off()