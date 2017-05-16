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

## Draw Plot1
png(file="plot1.png",width = 480,height = 480)
hist(final_data$Global_active_power, col = "Red", main = "Global Active Power", xlim = c(0,6), ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
