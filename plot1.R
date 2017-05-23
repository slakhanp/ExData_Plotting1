#Plot 4. Reading the file
power<- read_csv2("household_power_consumption.txt",col_names = TRUE,
                  col_types = list(col_date(format="%d/%m/%Y"), col_time(format="%H:%M:%S"),
                                   col_character(),col_character(),
                                   col_character(),col_character(),col_character(),
                                   col_character(),col_character()))

#Converting to numeric
power$Global_active_power=as.numeric(power$Global_active_power)
#Extracting data for 2 days
power_date<-power[which(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

#naming the file

jpeg('plot1. png')

hist(power_date$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlim=c(0,6),
     xlab = " Global Active Power(kilowatts) ", 
     ylab ="Frequency")

dev.off()