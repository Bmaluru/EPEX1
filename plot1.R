#Loading the dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Subsetting the data
plot_target <- household_power_consumption[as.character(household_power_consumption$Date) 
                                           %in% c('1/2/2007','2/2/2007'),]

# Getting histogram data
plt <- hist(as.numeric(plot_target$Global_active_power))

# Plotting the data
plot(plt,col='Red',main = "Global Active Power",
     xlab ="Global Active Power(kilowatt)",
     xaxt = 'n')

# X- Axis unit converion
axis(1,at = plt$breaks,labels = plt$breaks/1000)


# Exporting the plotting data
dev.copy(png,"plot1.png")
dev.off()
