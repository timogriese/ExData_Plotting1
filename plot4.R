# load data
x<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=T)
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-x[which(x$Date=='2007-02-01' | x$Date=='2007-02-02'),]
x$DateTime = strptime(paste(x$Date, x$Time, sep = ' '), format = "%Y-%m-%d %H:%M:%S")

# prepare multi plot draw
png(file = "plot4.png")

# plot 2x2
par(mfrow = c(2,2))

# plot #1
with(x, plot(x$DateTime, x$Global_active_power, type = 'lines', ylab = 'Global Active Power', xlab=''))

# plot #2
with(x, plot(x$DateTime, x$Voltage, type = 'lines', ylab = 'Voltage', xlab='datetime'))

# plot #3
with(x, plot(DateTime, Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab=''))
with(x, lines(DateTime, Sub_metering_1, col='black'))
with(x, lines(DateTime, Sub_metering_2, col='red'))
with(x, lines(DateTime, Sub_metering_3, col='blue'))
legend('topright', bty='n', cex=0.9, lwd=c(2.5,2.5), col=c('black', 'blue', 'red'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# plot #4
with(x, plot(x$DateTime, Global_reactive_power, type = 'lines', xlab='datetime'))

dev.off()
