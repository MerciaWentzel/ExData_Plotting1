read_household_power_consumption <- function() {

    fHPC <- "household_power_consumption.txt"
    if(!file.exists(fHPC)) {
        sURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        sZIP <- "HPC.zip"
        download.file(url = sURL, destfile = sZIP) ## tested only on Windows 10
        fHPC <- unzip(sZIP)
    }

    tHPC <- read.delim(
        file = fHPC,
        header = TRUE,
        sep = ";",
        na.strings = "?",
        skip = 66636, ## skip rows where Date < 1/2/2007
        nrows = 2880 ## read rows where Date = 1/2/2007 & Date = 2/2/2007 only
    )
    ## alternative method - comment out skip and nrows above, comment in below: 
    #tHPC[, 1] <- as.Date(tHPC[, 1], format="%d/%m/%Y")
    #tHPC <- tHPC[(tHPC[, 1] == "2007-02-01") | (tHPC[, 1] == "2007-02-02"), ]
    
    colnames(tHPC) <- c(
        "Date", 
        "Time", 
        "Global_active_power", 
        "Global_reactive_power", 
        "Voltage", 
        "Global_intensity",
        "Sub_metering_1", 
        "Sub_metering_2", 
        "Sub_metering_3"
    )

    tHPC$Date <- as.Date(tHPC$Date, format="%d/%m/%Y")
    tHPC$Global_active_power <- as.numeric(as.character(tHPC$Global_active_power))
    tHPC$Global_reactive_power <- as.numeric(as.character(tHPC$Global_reactive_power))
    tHPC$Voltage <- as.numeric(as.character(tHPC$Voltage))
    tHPC$Global_intensity <- as.numeric(as.character(tHPC$Global_intensity))
    tHPC$Sub_metering_1 <- as.numeric(as.character(tHPC$Sub_metering_1))
    tHPC$Sub_metering_2 <- as.numeric(as.character(tHPC$Sub_metering_2))
    tHPC$Sub_metering_3 <- as.numeric(as.character(tHPC$Sub_metering_3))
    
    tHPC <- transform(tHPC, datetime = as.POSIXct(paste(Date, Time))) ## add datetime column
    
    tHPC ## return
    
}