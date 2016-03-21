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



# Make plot and add legend
png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")

# 2x2 subplots
par(mfrow = c(2, 2), mar = c(4, 5, 1, 1))

# ------- Plot1
with(sub2, plot(Time,
                sub2$Global_active_power,
                type="l",
                xlab="",
                ylab="Global Active Power"))



# ------- Plot2
with(sub2, plot(Time,
                sub2$Voltage,
                type="l",
                xlab="datetime",
                ylab="Voltage"))



# ------- Plot3
with(sub2, plot(Time,
                sub2$Sub_metering_1,
                type="l",
                xlab="",
                ylab="Energy sub metering"))
with(sub2, lines(Time,
                 sub2$Sub_metering_2,
                 type="l",
                 col="red"))
with(sub2, lines(Time,
                 sub2$Sub_metering_3,
                 type="l",
                 col="blue"))
legend("topright",
       legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),
       bty = "n",
       lty = c(1,1,1),
       lwd = c(1,1,1),
       col = c("black", "red", "blue"))



# ------- Plot4
with(sub2, plot(Time,
                sub2$Global_reactive_power,
                type="l",
                xlab="datetime",
                ylab="Global_reactive_power"))

dev.off()

