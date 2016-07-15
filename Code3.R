loadDataMakePlot <- function()
{       
        data <- read.csv2.sql(
                "household_power_consumption.txt", 
                sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'",
                na.strings = "?") 
        
        png(file = "plot3.png")
        
       
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")                  
        newData <- within(data, Data_Time <- paste(data$Date, data$Time))    
        newData$Data_Time <- strptime(newData$Data_Time, "%Y-%m-%d %H:%M:%S") 
        
    
        yLabel <- "Energy sub metering"
        plot  (newData$Data_Time, newData$Sub_metering_1, type = "l", xlab = "", ylab = yLabel, col = "Black")
        points(newData$Data_Time, newData$Sub_metering_2, type = "l", xlab = "", ylab = yLabel, col = "Red")
        points(newData$Data_Time, newData$Sub_metering_3, type = "l", xlab = "", ylab = yLabel, col = "Blue")
        plotColors <- c("black", "red", "blue")
        plotLegend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        legend("topright", lty = 1, col = plotColors, legend = plotLegend)
        dev.off()
        
}
