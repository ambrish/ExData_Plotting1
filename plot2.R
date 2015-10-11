setwd("E:\\Amber\\Personal-Learning\\JHU\\4) Exploratory Data Analysis")

source("load_data.R")

plot2 <- paste(getwd(), "/graficos/plot2.png", sep = "")
if(!file.exists(plot2)){
  png("graficos/plot2.png", width = 480, height = 480)
  plot(cargarcourseProject$Time, cargarcourseProject$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
} else {
  plot(cargarcourseProject$Time, cargarcourseProject$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
}