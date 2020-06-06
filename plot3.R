#Import Libraries

library(sqldf)


# Load Data

df <- read.csv.sql("./exdata_data_household_power_consumption/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Plotting
plot(df$DateTime, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type ="l")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.8)
dev.copy(png, file = "plot3.png")
dev.off()