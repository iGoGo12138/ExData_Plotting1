## plot 3
## read the input data while skipping unnecessary readings
## add back the header
## convert time class
## make multiple plots with different color
## add legend
## export to png

inputdata <-read.table('household_power_consumption.txt', header = FALSE, sep = ';', na.strings = '?', skip = 66637, nrows = 2880)
header <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', nrows = 1)
names(inputdata) <- names(header)
timevariable <- paste(inputdata[,1],inputdata[,2])
timevariable <- strptime(timevariable,format = "%d/%m/%Y %H:%M:%S")
quartz()
plot(timevariable,inputdata$Sub_metering_1, type = 'l', xlab = '',ylab = 'Energy sub metering',col ='black')
lines(timevariable,inputdata$Sub_metering_2, col ='red')
lines(timevariable,inputdata$Sub_metering_3, col ='blue')
legend('topright', col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
