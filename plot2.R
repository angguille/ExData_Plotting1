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

## Creating and assigning plot2 file as device

png(file = "plot2.png", bg = "White")

## We create the base of the plot-free draw points (type = "n") 
## Also without annotations (ann = "n") 
## No data on the x axis (xaxt = "n") 
##Later will include, We draw lines between points

plot(as.numeric(DTutil$Global_active_power), ann = FALSE, type = "l",xaxt="n")


## Add legend and annotations in x
title(ylab = "Global Active Power (kilowats)")
axis(1,c(1,1442,2880),c("Thu","Fri","Sat"))

## closing device

dev.off()
