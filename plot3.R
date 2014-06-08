plot_energy_sub_metering <- function(box.lty = par("lty")){
  with(data,{
    plot(
      x=Date.Time,
      y=Sub_metering_1,
      type="l",
      main="",
      ylab="Energy sub metering",
      xlab=""
    )
    lines(
      x=Date.Time,
      y=Sub_metering_2,
      col="red"
    )
    lines(
      x=Date.Time,
      y=Sub_metering_3,
      col="blue"
    )
    legend(
      "topright",
      lty   = par("lty"),
      box.lty = box.lty,
      col   = c("black","red","blue"),
      legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    )
  })
}


source("getData.R")

# Force labels to be in english
Sys.setlocale(category = "LC_TIME", locale = "en_US")

png(filename="plot3.png")
plot_energy_sub_metering()
dev.off()
