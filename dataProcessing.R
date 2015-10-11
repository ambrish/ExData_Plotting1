setwd("E:\\Amber\\Personal-Learning\\JHU\\4) Exploratory Data Analysis")

library(httr) 

Datafile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

courseProject <- "courseProject"
if(!file.exists(courseProject)){
  dir.create(courseProject)
}


archive <- paste(getwd(), "/courseProject/household_power_consumption.zip", sep = "")
if(!file.exists(archive)){
  download.file(Datafile, archive, method="curl", mode="wb")
}
archive <- paste(getwd(), "/courseProject/household_power_consumption.txt", sep = "")
if(!file.exists(archive)){
  unzip(archive,"courseProject")
}

courseProjectresumidos <- paste(getwd(), "/courseProject/courseProjectresumidos.rds", sep = "")
if(!file.exists(courseProjectresumidos)){
  courseProject <- "courseProject/household_power_consumption.txt"
  cargarcourseProject <- read.table(courseProject, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  cargarcourseProject$Time <- strptime(paste(cargarcourseProject$Date, cargarcourseProject$Time), "%d/%m/%Y %H:%M:%S")
  cargarcourseProject$Date <- as.Date(cargarcourseProject$Date, "%d/%m/%Y")
  fechas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  cargarcourseProject <- subset(cargarcourseProject, Date %in% fechas)
  courseProjectresumidos <- paste(getwd(), "/", "courseProject", "/", "courseProjectresumidos", ".rds", sep="")
  saveRDS(cargarcourseProject, courseProjectresumidos)
} else {
  courseProject <- "courseProject/courseProjectresumidos.rds"
  cargarcourseProject <- readRDS(courseProject)
}