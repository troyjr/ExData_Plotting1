readfiledata<- function() {
        x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
        y<-x[grep("^[1-2]/2/2007", x$Date),]
        return(y)
}

plot2 <- function(x) {
        datetime<-as.POSIXct(strptime(paste(x$Date, " ", x$Time), "%d/%m/%Y %H:%M:%S"))
        png("plot2.png", width=480, height=480, units="px")
        plot(as.numeric(x$Global_active_power) ~ datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
}

plot2(readfiledata())