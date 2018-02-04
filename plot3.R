plot3 <- function() {

    tHPC <- read_household_power_consumption()

    plot(tHPC$datetime, tHPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(tHPC$datetime, tHPC$Sub_metering_2, col="red")
    lines(tHPC$datetime, tHPC$Sub_metering_3, col="blue")
    legend(
        "topright", 
        col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1), 
        lwd=c(1,1)
    )
    
    dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")    
    dev.off()
}
