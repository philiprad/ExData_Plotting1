plot3 <-function (){
        
        filename<-"household_power_consumption.txt"
        #Read the data
        df <- read.table(filename, header = TRUE, sep = ";", colClasses = 
                c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric"), na.strings="?")
        
        #Parse column date as Date
        df[,1]<-as.Date(df[,1], "%d/%m/%Y")
        
        #Specify date range
        specifiedDates=subset(df,df[,1]<="2007-2-2" & df[,1]>="2007-2-1")
        
        #Convert date column back to character
        df[,1]<-as.character(df[,1], "%d/%m/%Y")
        
        #Merge date and time
        datetime<-strptime(paste(specifiedDates$Date,specifiedDates$Time),
                           format="%Y-%m-%d %H:%M:%S")
        
        #Prepare png export
        png(file="plot3.png",width=480,height=480)
        
        #Construct the graph
        with(specifiedDates, 
             plot(datetime,specifiedDates$Sub_metering_1, 
                  type="l",ylab="Energy sub metering", xlab=""))
        
        with(specifiedDates, 
             points(datetime,specifiedDates$Sub_metering_2, 
                  type="l",ylab="Energy sub metering", xlab="",col="red"))
        
        with(specifiedDates, 
             points(datetime,specifiedDates$Sub_metering_3, 
                  type="l",ylab="Energy sub metering", xlab="",col="blue"))
        
        legend("topright",lwd="1",col=c("black","red","blue"), 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        #Save the file
        dev.off()
}