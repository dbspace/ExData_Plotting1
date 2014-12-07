hpcData <- read.table("./data/household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)

hpcData2day <- subset (hpcData, Date == "1/2/2007" | Date == "2/2/2007")
d1="1/2/2007"
png(filename = "plot4.png")

par(mfrow = c(2,2))
#plot first graph
tsData <-ts(hpcData2day$Global_active_power, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)
plot.ts(tsData,axes=F, ylab="Global Active Power (kilowatts)", xlab="")
axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()

#plot the 2nd graph
tsDataVol <-ts(hpcData2day$Voltage, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)
plot.ts(tsDataVol,axes=F, ylab="Voltage", xlab="datetime")
axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()


#plot the 3rd graph
hpcData2day1 <-hpcData2day[,c(7,8,9)]

tsDatat <-ts(hpcData2day1, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)

plot.ts(tsDatat,axes=F, ylab="Sub Metering", xlab="", 
        plot.type="single", col = c("black", "red", "blue"))

axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

#plot the 4 graph
tsDataReact <-ts(hpcData2day$Global_reactive_power, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)
plot.ts(tsDataReact,axes=F, ylab="Global_reactive_power", xlab="datetime")
axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()
dev.off()