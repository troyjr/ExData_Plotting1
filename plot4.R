readfiledata<- function() {
        x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
        y<-x[grep("^[1-2]/2/2007", x$Date),]
        return(y)
}

plot4 <- function(x) {
        datetime<-as.POSIXct(strptime(paste(x$Date, " ", x$Time), "%d/%m/%Y %H:%M:%S"))
        png("plot4.png", width=480, height=480, units="px")
        # 4 plots
        par(mfrow=c(2,2))
        plot(as.numeric(x$Global_active_power) ~ datetime, type="l", xlab="", ylab="Global Active Power")
        plot(as.numeric(x$Voltage) ~ datetime, type="l", xlab="datetime", ylab="Voltage")
        plot(as.numeric(x$Sub_metering_1) ~ datetime, type="n", xlab="", ylab="Energy Sub Metering")
        lines(as.numeric(x$Sub_metering_1) ~ datetime)
        lines(as.numeric(x$Sub_metering_2) ~ datetime, col="red")
        lines(as.numeric(x$Sub_metering_3) ~ datetime, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), x.intersp=2)
        plot(as.numeric(x$Global_reactive_power) ~ datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
        dev.off()
}

plot4(readfiledata())
