loadDataMakePlot <- function()
{       
        data <- read.csv2.sql(
                "household_power_consumption.txt", 
                sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'",
                na.strings = "?") 
        
        
        png(file = "plot2.png")
        
       
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")                  
        newData <- within(data, Data_Time <- paste(data$Date, data$Time))     
        newData$Data_Time <- strptime(newData$Data_Time, "%Y-%m-%d %H:%M:%S") 
      
        plot(newData$Data_Time, newData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
      
        dev.off()

}
