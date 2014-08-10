## We will use the data table package, so if not loaded, you must first read

## library("data.table", lib.loc="~/R/win-library/3.1")

## Read data

DT <- fread("household_power_consumption.txt", na.strings=c("NA","?",""))

## Add the column "dia" with dates in appropriate format

DT$dia=as.Date(DT[,Date], format="%d/%m/%Y")

## We choose the data that interest us

DTutil <- DT[DT$dia == "2007-02-01" | DT$dia == "2007-02-02",]

## We remove the original table to free up space
rm(DT)

## Sort by day and time
setkeyv(DTutil,c("dia","Time"))

## Creating and assigning plot3 file as device

png(file = "plot3.png", bg = "White")

# Draw the three graphics and add annotations
plot(as.numeric(DTutil$Sub_metering_1), col="black",ann = FALSE, type = "l",xaxt="n")

points(as.numeric(DTutil$Sub_metering_2), col="red",type= "l")

points(as.numeric(DTutil$Sub_metering_3), col="blue",type= "l")

title(ylab = "Energy sub metering")

axis(1,c(1,1442,2880),c("Thu","Fri","Sat"))

# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=1,lwd=2, text.font=6)

## closing device

dev.off()
