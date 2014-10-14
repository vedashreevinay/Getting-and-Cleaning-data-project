plot1 <- function()
{
  hh_data <- read_data()
  head(hh_data)
  hist(hh_data$Global_active_power, col = "red", main = "Golbal Active Power", xlab="Global Active Power (kilowatts)" )
  dev.copy(png, file = "plot1.png", width = 480, height = 480 )
  dev.off()
  cat("Histogram saved in", getwd())
}