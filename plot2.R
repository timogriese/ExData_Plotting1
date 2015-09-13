# load data
x<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=T)
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-x[which(x$Date=='2007-02-01' | x$Date=='2007-02-02'),]
x$DateTime = strptime(paste(x$Date, x$Time, sep = ' '), format = "%Y-%m-%d %H:%M:%S")

# plot
png(file = "plot2.png")
with(x, plot(x$DateTime, x$Global_active_power, type = 'lines', ylab = 'Global Active Power (kilowatts)', xlab=''))
dev.off()
