library(dplyr)
library(tidyr)
## Downloading the file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "helec.zip")
downloadtime<-date()
## unziped the file
unzip("./helec.zip")
## read table
helec<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
## filtered the required period
selected<-c("1/2/2007","2/2/2007")
feb<-helec[helec$Date %in% selected,]
## Data transformation to dates and numeric values as suitable for each column and variable type
feb$Date<-as.Date(feb$Date, format = "%d/%m/%Y")
feb<-feb %>% unite (col= "datetime",Date,Time, sep = " ")
feb$datetime<-strptime(feb$datetime, format = "%Y-%m-%d %H:%M:%S")
febcolnames<-c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
feb[febcolnames]<-sapply(feb[febcolnames],as.character)
feb[febcolnames]<-sapply(feb[febcolnames],as.numeric)
