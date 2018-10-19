png(filename = "plot2.png")
plot(feb$datetime,feb$Global_active_power, type = "n",xlab = "",ylab ="Global Active Power (killowatts)")
lines(feb$datetime,feb$Global_active_power,type = "l")
dev.off()
