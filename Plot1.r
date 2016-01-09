plot1 <- function()
{
  
  baseTable <- read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings = c("?","?","?","?","?","?","?","?","?"))
  
  febDays <- subset(baseTable,Date == "1/2/2007" | Date == "2/2/2007")
  
  ## There is likely a way to subset the read.table itself.  Will research time permitting.
  ## In the meantime, release the memory back for the main table.
  rm(baseTable)
  
  with(febDays,hist(Global_active_power,xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power"))
  
  dev.copy(png,"Plot1.png")
  dev.off()
}