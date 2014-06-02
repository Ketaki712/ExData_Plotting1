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
png("plot1.png",width =480,height=480)
hist(data_to_analyze$Global_active_power,col="red", main ="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()