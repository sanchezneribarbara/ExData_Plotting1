URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "dataset.zip")
unzip("dataset.zip")

source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")