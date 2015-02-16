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
#plot line graph
plot(DF2$dateTime, DF2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")
# create PNG version of graph
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()