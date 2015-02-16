# reading in data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./house.txt",method="curl")

DF <- read.table("./house.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.string="?",colClasses=classes,comment.char="")

# subset target data
DF2 <- DF[(DF$Date =="1/2/2007" | DF$Date == "2/2/2007"),]
# convert Date column to Date type
DF2$Date <- as.Date(DF2$Date,"%d/%m/%Y")
#create time series variable dateTime
datetime <- as.POSIXct(paste(DF2$Date, DF2$Time), "%d/%m/%Y %H:%M:%S",tz="UTC")
#then add new column to dataframe
data2$dateTime <- datetime
#create templat for 2 row 2 col plot
par(mfrow=c(2,2))

#plot 1
plot(DF2$dateTime, DF2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")

#plot 2
plot(DF2$dateTime, DF2$Voltage, type="l", xlab = "datetime", ylab="Voltage")

#plot 3
# set up template for plotting data
plot(DF2$dateTime, DF2$Sub_metering_1, type="n",ylab="Energy Sub Metering",xlab="")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
lines(DF2$dateTime,DF2$Sub_metering_1,col="black")
lines(DF2$dateTime,DF2$Sub_metering_2,col="red")
lines(DF2$dateTime,DF2$Sub_metering_3,col="blue")

#plot 4
plot(DF2$dateTime, DF2$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
# create PNG version of graph
dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()