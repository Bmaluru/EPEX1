#loading the dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Subsetting the data
plot_target <- household_power_consumption[as.character(household_power_consumption$Date) 
                                           %in% c('1/2/2007','2/2/2007'),]

#Applying the date transformation
plot_target$Date <- strptime( apply( plot_target[ , c("Date","Time") ], 
                                      1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

# Plotting the data
plot(plot_target$Date,plot_target$Global_active_power,type="l",
     xlab = "", ylab = "Global Active Power(Watts)")


# Exporting the plotting data
dev.copy(png,"plot2.png")
dev.off()