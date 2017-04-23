# This script reads the household_power_consumption data file and creates a plot
# per the assignment requirements.
# This script is run directly by sourcing (source("plot2.R")), not a function call, so that 
# all objects are in the global environment, available for inspection and manipulation
# from the command line

# Name of the output file
fname="plot2.png"

# Read file into R
D <- read.csv("household_power_consumption.txt",sep=";")
# Date range to be used
start_dt<-as.POSIXlt("2007-02-01 00:00:00")
end_dt<-as.POSIXlt("2007-02-02 23:59:59")
# Size of the output file
wd <- 480
ht <- 480
ut <- "px"

# Create DateTime column by combining the Date and Time columns
D$DateTime <- strptime(paste(D$Date,D$Time),"%d/%m/%Y %H:%M:%S")

# Select only what will be used in the plots (not necessarily just this one)
# This is also good for non-wrap-around viewing of the data in head(),tail())
# There is no need to add the day of the week to the data.
D_plot <- D[c("DateTime","Global_active_power")]

# Restrict the data to what we will use for this plot
D_plot<- subset(D_plot,DateTime>=start_dt & DateTime <= end_dt)

# Plot this bad boy
png(file=fname,width=wd,height=ht,units=ut)

# Plot lines (type = "l"), no x axis label, no title (per the assignment plot)
with(D_plot,
     plot(DateTime,Global_active_power,
          type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)")
     )

dev.off()

