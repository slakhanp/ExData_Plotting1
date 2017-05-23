
power<- read_csv2("household_power_consumption.txt",col_names = TRUE,
                  col_types = list(col_date(format="%d/%m/%Y"), col_time(format="%H:%M:%S"),
                                   col_character(),col_character(),
                                   col_character(),col_character(),col_character(),
                                   col_character(),col_character()))


power$Global_active_power=as.numeric(power$Global_active_power)
power_date<-power[which(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

jpeg('plot1. png')

hist(power_date$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
      xlim=c(0,6),
     xlab = " Global Active Power(kilowatts) ", 
     ylab ="Frequency")

dev.off()

power_date_na <- transform(power_date_na, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

jpeg('plot2. png')
plot(y=power_date_na$Global_active_power, x=power_date_na$timestamp, type="l",
     ylab = " Global Active Power(kilowatts) ", xlab= "")

dev.off()
jpeg('plot3. png')
plot(y=power_date_na$Sub_metering_1, x=power_date_na$timestamp, type="l",
     ylab = " Energy sub metering ", xlab= "")
lines(y=power_date_na$Sub_metering_2, x=power_date_na$timestamp, type="l",col="red")
lines(y=power_date_na$Sub_metering_3, x=power_date_na$timestamp, type="l", col="blue")

legend('topright', names(power_date_na)[7:9], col=c('black','red','blue'), lty=1)

dev.off()

jpeg('plot4. png')
par(mfrow=c(2,2))

plot(y=power_date_na$Global_active_power, x=power_date_na$timestamp, type="l",
     ylab = " Global Active Power(kilowatts) ", xlab= "")


plot(y=power_date_na$Voltage, x=power_date_na$timestamp, type="l",
     ylab = " Voltage ", xlab= "datetime")


plot(y=power_date_na$Sub_metering_1, x=power_date_na$timestamp, type="l",
     ylab = " Energy sub metering ", xlab= "")
lines(y=power_date_na$Sub_metering_2, x=power_date_na$timestamp, type="l",col="red")
lines(y=power_date_na$Sub_metering_3, x=power_date_na$timestamp, type="l", col="blue")

legend('topright', names(power_date_na)[7:9], col=c('black','red','blue'), lty=1, cex=0.75)



plot(y=power_date_na$Global_reactive_power, x=power_date_na$timestamp, type="l",
     ylab = " Global_reactive_power ", xlab= "datetime")

dev.off()