hpcData <- read.table("./data/household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)

hpcData2day <- subset (hpcData, Date == "1/2/2007" | Date == "2/2/2007")
d1="1/2/2007"
png(filename = "plot3.png")
hpcData2day1 <-hpcData2day[,c(7,8,9)]

tsDatat <-ts(hpcData2day1, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)

plot.ts(tsDatat,axes=F, ylab="Sub Metering", xlab="", 
        plot.type="single", col = c("black", "red", "blue"))

axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()