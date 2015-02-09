# reading in data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./house.txt",method="curl")

DF <- read.table("./house.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.string="?",colClasses=classes,comment.char="")

# subset target data
DF2 <- DF[(DF$Date =="1/2/2007" | DF$Date == "2/2/2007"),]
# convert Date column to Date type
DF2$Date <- as.Date(DF2$Date,"%d/%m/%Y")
# convert Time column to Time tupe of POSIXlt
DF2$Time <- strptime(DF2$Time,"%H:%M:%S")
# set up template for plotting data
plot(DF$Time, DF$Sub_metring_1,type="n",ylab="Energy Sub Metering")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
lines(DF$Time,DF$Sub_metring_1)
lines(DF$Time,DF$Sub_metring_2)
lines(DF$Time,DF$Sub_metring_3)
# create PNG version of histogram
dev.copy(png,file="plot3.png")
dev.off()
