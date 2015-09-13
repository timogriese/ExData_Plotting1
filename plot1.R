# load data
x<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=T)
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-x[which(x$Date=='2007-02-01' | x$Date=='2007-02-02'),]

# plot
png(file = "plot1.png")
hist(x$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()