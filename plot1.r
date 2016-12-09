## plot 1
## read the input data while skipping unnecessary readings
## add back the header
## call out quartz()
## plot histogram 
## copy to png
inputdata <-read.table('household_power_consumption.txt', header = FALSE, sep = ';', na.strings = '?', skip = 66637, nrows = 2880)
header <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', nrows = 1)
names(inputdata) <- names(header)
quartz()
hist(inputdata$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
