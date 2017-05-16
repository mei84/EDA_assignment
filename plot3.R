setwd("C:/Users/¿Ô/Desktop/Rprogramming/assignment/EDA")
getwd()

library(dplyr)

rdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

data <- rdata %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")
Time <- strptime(paste(data$Date,data$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")
Time <- data.frame(Time)
final_data <- data.frame(Time, data[,3:9])
View(final_data)
str(final_data)

## Draw Plot3
png(file="plot3.png",width = 480,height = 480)
plot(final_data$Time, final_data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(final_data$Time, final_data$Sub_metering_2, type = "l", col = "red")
lines(final_data$Time, final_data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", y = NULL, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
