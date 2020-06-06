#Import Libraries

library(sqldf)


# Load Data

df <- read.csv.sql("./exdata_data_household_power_consumption/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

# Combining Date and Time variables

df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

#plotting
par(mfrow = c(2,2))

# Top Left
plot(df$DateTime, df$Global_active_power, xlab="datetime", ylab="Global Active Power", type = "l")

# Top Right
plot(df$DateTime, df$Voltage, xlab="datetime", ylab="Voltage", type = "l")

# Bottom Left
plot(df$DateTime, df$Sub_metering_1, xlab = "datetime", ylab = "Energy sub metering", type ="l")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red", "blue"), cex=0.5, y.intersp = 0.5, box.lty = 0, bty = "n")

#Bottom Right
plot(df$DateTime, df$Global_reactive_power, xlab="datetime", ylab="Global Active Power", type = "l")

dev.copy(png, file = "plot4.png")
dev.off()
