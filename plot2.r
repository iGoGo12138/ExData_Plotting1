## plot 2
## read the input data while skipping unnecessary readings
## add back the header
## convert time class
## make plot
## export to png

inputdata <-read.table('household_power_consumption.txt', header = FALSE, sep = ';', na.strings = '?', skip = 66637, nrows = 2880)
header <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', nrows = 1)
names(inputdata) <- names(header)
timevariable <- paste(inputdata[,1],inputdata[,2])
timevariable <- strptime(timevariable,format = "%d/%m/%Y %H:%M:%S")
quartz()
plot(timevariable,inputdata$Global_active_power, type = 'l', xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

