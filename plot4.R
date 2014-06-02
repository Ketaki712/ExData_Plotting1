data_to_analyze <- read.table(file = "household_power_consumption.txt", 
                              sep = ";", 
                              skip = 66637,
                              nrows = 2880,
                              na.strings= "?")
#It takes 81 sec to read the entire txt file vs. 19 sec to read the required number of rows.
# alternative ways to subset the file would include using grep,sqldf 
a <-  colnames(read.table("household_power_consumption.txt", sep = ";",nrow = 1, header = TRUE)) 
# assigning column names to the data frame
names(data_to_analyze) <- a
str(data_to_analyze)
date_time <- paste(data_to_analyze$Date,data_to_analyze$Time)
day_of_the_week <- strptime(date_time, format ='%d/%m/%Y %H:%M:%S')
str(day_of_the_week)
png("plot4.png",width =480,height=480)
par(mfrow =c(2,2))
plot(day_of_the_week,data_to_analyze$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(day_of_the_week,data_to_analyze$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(day_of_the_week,data_to_analyze$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(day_of_the_week,data_to_analyze$Sub_metering_2,col = "red")
lines(day_of_the_week,data_to_analyze$Sub_metering_3,col= "blue")
legend("topright", lty=1,bty ="n",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(day_of_the_week,data_to_analyze$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()