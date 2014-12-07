hpcData <- read.table("./data/household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)

hpcData2day <- subset (hpcData, Date == "1/2/2007" | Date == "2/2/2007")
d1="1/2/2007"
png(filename = "plot2.png")
tsData <-ts(hpcData2day$Global_active_power, start=as.Date(d1, "%d/%m/%Y"), frequency=24*60)
plot.ts(tsData,axes=F, ylab="Global Active Power (kilowatts)", xlab="")
axis(2) # plot the y axis
axis(1, labels=weekdays(time1), at=seq(from=13545, to=13547, length.out=length(time1))  )
box()
dev.off()