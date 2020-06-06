#Import Libraries

library(sqldf)


# Load Data

df <- read.csv.sql("./exdata_data_household_power_consumption/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")


#Plotting

hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, "plot1.png")
dev.off()