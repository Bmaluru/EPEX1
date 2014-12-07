#loading the dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Subsetting the data
plot_target <- household_power_consumption[as.character(household_power_consumption$Date) 
                                           %in% c('1/2/2007','2/2/2007'),]

#Applying the date transformation
plot_target$Date <- strptime( apply( plot_target[ , c("Date","Time") ], 
                                     1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

# Creating the plot
plot(plot_target$Date,plot_target$Sub_metering_1,
     ylab = "Energy Sub Metering",
     xlab="",
     type = "l")
lines(plot_target$Date,plot_target$Sub_metering_2,col="Red")
lines(plot_target$Date,plot_target$Sub_metering_3,col = "Blue")

# Adding the markings
legend("topright",col=c("Black","Red","Blue"),
       legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), lty = 1)


# Exporting the plotting data
dev.copy(png,"plot3.png")
dev.off()