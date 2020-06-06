#Import Libraries

library(sqldf)


# Load Data

df <- read.csv.sql("./exdata_data_household_power_consumption/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Plotting
plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()