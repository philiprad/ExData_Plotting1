plot1 <-function (){
                
        filename<-"household_power_consumption.txt"
        #Read the data
        df <- read.table(filename, header = TRUE, sep = ";", colClasses = 
                c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric"), na.strings="?")
        
        #Parse column date as Date
        df[,1]<-as.Date(df[,1], "%d/%m/%Y")
        
        #Specify date range
        specifiedDates=subset(df,df[,1]<="2007-2-2" & df[,1]>="2007-2-1")
        
        #Prepare png export
        png(file="plot1.png",width=480,height=480)
        
        #Construct the histogram
        hist(specifiedDates$Global_active_power,
             xlab="Global Active Power (kilowatts)", 
             col="red",main="Global Active Power")
        
        #Save the file
        dev.off()
}