#Plot 3. Reading the file
power<- read_csv2("household_power_consumption.txt",col_names = TRUE,
                  col_types = list(col_date(format="%d/%m/%Y"), col_time(format="%H:%M:%S"),
                                   col_character(),col_character(),
                                   col_character(),col_character(),col_character(),
                                   col_character(),col_character()))

#Converting to numeric
power$Global_active_power=as.numeric(power$Global_active_power)
#Extracting data for 2 days
power_date<-power[which(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]
#Transforming date and time 
power_date_na <- transform(power_date_na, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
#naming the file
jpeg('plot3. png')
plot(y=power_date_na$Sub_metering_1, x=power_date_na$timestamp, type="l",
     ylab = " Energy sub metering ", xlab= "")
lines(y=power_date_na$Sub_metering_2, x=power_date_na$timestamp, type="l",col="red")
lines(y=power_date_na$Sub_metering_3, x=power_date_na$timestamp, type="l", col="blue")

legend('topright', names(power_date_na)[7:9], col=c('black','red','blue'), lty=1)

dev.off()