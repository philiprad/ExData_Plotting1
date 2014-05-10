plot2 <-function (){
        
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
        png(file="plot2.png",width=480,height=480)
        
        #Construct the line graph
        plot(datetime,specifiedDates$Global_active_power,
             type="l",ylab="Global Active Power (kilowatts)",xlab="")
        #Save the file
        dev.off()
}