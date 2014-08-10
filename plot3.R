readfiledata<- function() {
        x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
        y<-x[grep("^[1-2]/2/2007", x$Date),]
        return(y)
}

plot3 <- function(x) {
        datetime<-as.POSIXct(strptime(paste(x$Date, " ", x$Time), "%d/%m/%Y %H:%M:%S"))
        png("plot3.png", width=480, height=480, units="px")
        plot(as.numeric(x$Sub_metering_1) ~ datetime, type="n", xlab="", ylab="Energy Sub Metering")
        lines(as.numeric(x$Sub_metering_1) ~ datetime)
        lines(as.numeric(x$Sub_metering_2) ~ datetime, col="red")
        lines(as.numeric(x$Sub_metering_3) ~ datetime, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
        
        dev.off()
}

plot3(readfiledata())