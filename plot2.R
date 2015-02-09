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
plot(DF$Time, DF$Global_active_power,type="n",ylab="Global Active Power (kilowatts)")
lines(DF$Time,DF$Global_active_power)
# create PNG version of histogram
dev.copy(png,file="plot2.png")
dev.off()