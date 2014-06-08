## Gets househould power consumption data from te net
## fills a dataset `data` with tidied data for 
## 2007-02-01 upto and including 2007-02-02
##
## Tries to minimize the amount of work done, by storing intermediate results

# download dataset
filename.zip.local <- "./Electric power consumption.zip"
if (!file.exists(filename.zip.local)) {
  download.file(
    url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
    destfile= filename.zip.local,
    method = "curl"
  )
}

# extract dataset
filename.local <- "household_power_consumption.txt"
if (!file.exists(filename.local)){
  unzip(filename.zip.local)
}

filename.subsetted <- "househould_power_consumption_subsetted.csv"
if (!file.exists(filename.subsetted)){
  # get relevant data
  data.all <- read.csv(
    filename.local,
    header=TRUE,              #TBD skip lines, but keep header...
    sep=";",
    stringsAsFactors = FALSE,
    na.strings="?",
    nrows = 2075259
  )
  
  # subset without converting to dates
  data <- data.all[data.all$Date=="2/2/2007" | data.all$Date=="1/2/2007" , ]

  #convert dates and times
  data$Date.Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data <- data[ , c(1,10,3,4,5,6,7,8,9)]    #Date, Date.Time, measurements
  write.csv(data,filename.subsetted)

  #cleanup
  #rm(data.all)
} else {
  data <- read.csv(
    filename.subsetted,
    stringsAsFactors = FALSE)   
    data$Date.Time <- strptime(data$Date.Time,"%Y-%m-%d %H:%M:%S")
    data$Date <- as.Date(data$Date)
}



