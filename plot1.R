plot1 <- function() {

    tHPC <- read_household_power_consumption()
    
    par(mfrow = c(1, 1)) ## reset in case this is run after plot4
    
    hist(
        x = tHPC$Global_active_power, 
        col = "red", 
        xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power")

    dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")    
    dev.off()
}
