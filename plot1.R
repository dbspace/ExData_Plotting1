hpcData <- read.table("./data/household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)

hpcData2day <- subset (hpcData, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png")
hist(hpcData2day$Global_active_power, col="Red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()