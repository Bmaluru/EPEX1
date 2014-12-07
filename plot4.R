#loading the dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Subsetting the data
plot_target <- household_power_consumption[as.character(household_power_consumption$Date) 
                                           %in% c('1/2/2007','2/2/2007'),]

#Applying the date transformation
plot_target$Date <- strptime( apply( plot_target[ , c("Date","Time") ], 
                                     1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

# Creating space for 4 plots
par(mfrow=c(2,2))

plot(plot_target$Date,plot_target$Global_active_power,
     ylab = "Global Active Power",
     type="l",
     xlab ="")

plot(plot_target$Date,plot_target$Voltage,
     type="l",
     ylab = "Voltage",
     xlab = "")

plot(plot_target$Date,plot_target$Sub_metering_1,
     type="l",
     ylab = "Energy sub metering",
     xlab = ""
     )
lines(plot_target$Date,plot_target$Sub_metering_2,col="Red")
lines(plot_target$Date,plot_target$Sub_metering_3,col = "Blue")

# Adding the markings
legend("topright",
       col=c("Black","Red","Blue"),
       legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), 
       lty = 1,
       cex = 0.3)

plot(plot_target$Date,plot_target$Global_reactive_power,
     type="l",
     ylab = "Global Reactive Power",
     xlab = "")

# Exporting the plotting data
dev.copy(png,"plot4.png")
dev.off()