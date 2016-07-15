# Exploratory-Data-Analysis
#Proj1

install.packages("sqldf")
library(sqldf)
sqldf()

loadDataMakePlot <- function()
{       

        data <- read.csv2.sql( "household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'",
                na.strings = "?") 
        
        
        png(file = "plot1.png")
        hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        sqldf()
        
}
