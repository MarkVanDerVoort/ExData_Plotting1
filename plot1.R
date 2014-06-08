plot1 <- function(){
  with(data,{
    hist(
      Global_active_power,
      col="red",
      main="Global active power",
      xlab="Global active power (kilowatts)"
    )  
  })
}

source("getData.R")

png(filename = "plot1.png")
plot1()
dev.off()
