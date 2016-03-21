# Exploratory Data Analysis - Assignment Week #1

setwd("C:\\R\\data\\Coursera\\4_ExploratoryDataAnalysis\\Week1Assignment")


# Reading data
a <- read.table("household_power_consumption.txt",
                header = TRUE,
                stringsAsFactors = FALSE,
                na.strings = "?",
                sep=";")

# Subsetting
sub <- subset(a, Date %in% c("1/2/2007", "2/2/2007"))


# Cleaning Data - Converting characters to date and time to timestamp in Time.
sub2 <- sub
sub2$Time <- strptime(paste(sub2$Date, sub2$Time), "%d/%m/%Y %H:%M:%S")

# Creating plot
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

hist(sub2$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()