plot4 <- function() {

    tHPC <- read_household_power_consumption()

    par(mfrow=c(2,2)) ## mfrow fills rows then columns

    ## top left
    plot(tHPC$datetime, tHPC$Global_active_power, type="l", xlab="", ylab="Global Active Power")

    ## top right
    plot(tHPC$datetime, tHPC$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ## bottom left
    plot(tHPC$datetime, tHPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(tHPC$datetime, tHPC$Sub_metering_2,col="red")
    lines(tHPC$datetime, tHPC$Sub_metering_3,col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
    
    ## bottom right
    plot(tHPC$datetime, tHPC$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")    
    dev.off()
}
