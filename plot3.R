# load data
x<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=T)
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-x[which(x$Date=='2007-02-01' | x$Date=='2007-02-02'),]
x$DateTime = strptime(paste(x$Date, x$Time, sep = ' '), format = "%Y-%m-%d %H:%M:%S")

# plot
png(file = "plot3.png")
with(x, plot(DateTime, Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab=''))
with(x, lines(DateTime, Sub_metering_1, col='black'))
with(x, lines(DateTime, Sub_metering_2, col='red'))
with(x, lines(DateTime, Sub_metering_3, col='blue'))
legend('topright', lwd=c(2.5,2.5), col=c('black', 'blue', 'red'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
