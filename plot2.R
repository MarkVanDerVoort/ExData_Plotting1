plot2 <- function(){
  with(data,{
    plot(
      x=Date.Time,
      y=Global_active_power,
      type="l",
      main="",
      ylab="Global active power (kilowatts)",
      xlab=""
    )
  })
}

source("getData.R")

# Force labels to be in english
Sys.setlocale(category = "LC_TIME", locale = "en_US")

png(filename = "plot2.png")
plot2()
dev.off()
