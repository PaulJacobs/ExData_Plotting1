plot4 <- function()
{
  baseTable <- read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings = c("?","?","?","?","?","?","?","?","?"))
  
  febDays <- subset(baseTable,Date == "1/2/2007" | Date == "2/2/2007")
  
  ## There is likely a way to subset the read.table itself.  Will research time permitting.
  ## In the meantime, release the memory back for the main table.
  rm(baseTable)
  
  png(filename = "Plot4.png")
  
  par(mfrow=c(2,2))
  
  febDays <- transform(febDays,CombDateTime =  paste(as.Date(febDays$Date, format="%d/%m/%Y"),febDays$Time, sep = " "))
  febDays <- transform(febDays,CombDateTime2 =  strptime(CombDateTime, format="%Y-%m-%d %H:%M:%S"))
  
  plot(febDays$CombDateTime2,febDays$Global_active_power,type="n",xlab = "",
       ylab = "Global Active Power")
  lines(febDays$CombDateTime2,febDays$Global_active_power)
  
  plot(febDays$CombDateTime2,febDays$Voltage,type="n",
       ylab = "Voltage", xlab="datetime")
  lines(febDays$CombDateTime2,febDays$Voltage)
  
  plot(febDays$CombDateTime2,febDays$Sub_metering_1,type="n", ylab = "Energy sub metering", xlab = "")
  lines(febDays$CombDateTime2,febDays$Sub_metering_1)
  lines(febDays$CombDateTime2,febDays$Sub_metering_2, col = "red")
  lines(febDays$CombDateTime2,febDays$Sub_metering_3, col = "blue")
  legend("topright",lty=1,col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_3","Sub_metering_3"),
         pt.cex = 1,cex = 1, bty = "n")
  
  plot(febDays$CombDateTime2,febDays$Global_reactive_power,type="n",
       ylab = "Global_reactive_power", xlab="datetime")
  lines(febDays$CombDateTime2,febDays$Global_reactive_power) 
  
  dev.off()
}