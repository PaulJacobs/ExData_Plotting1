plot2 <- function()
{
  
  baseTable <- read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings = c("?","?","?","?","?","?","?","?","?"))
  
  febDays <- subset(baseTable,Date == "1/2/2007" | Date == "2/2/2007")
  
  ## There is likely a way to subset the read.table itself.  Will research time permitting.
  ## In the meantime, release the memory back for the main table.
  rm(baseTable)
  
  febDays <- transform(febDays,CombDateTime =  paste(as.Date(febDays$Date, format="%d/%m/%Y"),febDays$Time, sep = " "))
  febDays <- transform(febDays,CombDateTime2 =  strptime(CombDateTime, format="%Y-%m-%d %H:%M:%S"))
  
  plot(febDays$CombDateTime2,febDays$Global_active_power,type="n",xlab = "",
       ylab = "Global Active Power (kilowatts)")
  lines(febDays$CombDateTime2,febDays$Global_active_power)
  
  dev.copy(png,"Plot2.png")
  dev.off()
}