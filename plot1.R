plot1 <- function() {

    tHPC <- read_household_power_consumption()
    
    hist(
        x = tHPC$Global_active_power, 
        col = "red", 
        xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power")

    dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")    
    dev.off()
}
