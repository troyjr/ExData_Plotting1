readfiledata<- function() {
x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
y<-x[grep("[1-2]/2/2007", x$Date),]
return(y)
}

plot1 <- function(x) {
        png("plot1.png", width=480, height=480, units="px")
        hist(as.numeric(x$Global_active_power), col="red", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)") 
        dev.off()
}

plot1(readfiledata())