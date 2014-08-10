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

## Creating and assigning plot1 file as device

png(file = "plot1.png", bg = "White")

## We margins so that the drawing has the proportions of the statement

par(mar=c(5,5,4,2))

## Draw the histogram title and adding text on the x axis

hist(as.numeric(DTutil$Global_active_power), col= "red", main="Global Active Power", xlab="Global Active Power (kilowats)")

## closing device

dev.off()
