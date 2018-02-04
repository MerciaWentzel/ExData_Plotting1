plot2 <- function() {

    tHPC <- read_household_power_consumption()

    par(mfrow = c(1, 1)) ## reset in case this is run after plot4

    plot(
        tHPC$datetime,
        tHPC$Global_active_power,
        type = "l", 
        xlab = "", 
        ylab = "Global Active Power (kilowatts)"
    )    

    dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")    
    dev.off()
}
