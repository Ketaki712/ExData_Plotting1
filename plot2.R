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
png("plot2.png",width =480,height=480)
plot(day_of_the_week,data_to_analyze$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()