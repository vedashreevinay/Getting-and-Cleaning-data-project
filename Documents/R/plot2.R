plot2 <- function()
{
  hh_data <- read_data()
  plot(hh_data$timestamp, hh_data$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)" , type = "l")
  dev.copy(png, file = "plot2.png", width = 480, height = 480 )
  dev.off()
  cat("plot saved in", getwd())
}