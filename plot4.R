plot_global_active_power <- function(){
  #this is a copy of plot2, except for the y-axis label
  with(data,{
    plot(
      x=Date.Time,
      y=Global_active_power,
      type="l",
      main="",
      ylab="Global active power",
      xlab=""
    )
  })
}

source("plot3.R")   #to get plot_energy_sub_metering

plot_voltage <- function(){
  with(data,{
    plot(
      x=Date.Time,
      y=Voltage,
      type="l",
      main="",
      xlab="datetime"
    )
  })  
}

plot_global_reactive_power <- function(){
  with(data,{
    plot(
      x=Date.Time,
      y=Global_reactive_power,
      type="l",
      main="",
      xlab="datetime"
    )
  })  
  
}

plot_all <- function(){
  par(mfrow=c(2,2))
  plot_global_active_power()
  plot_voltage()
  plot_energy_sub_metering(box.lty="blank")
  plot_global_reactive_power()
}


source("getData.R")         #this has already been sourced by sourcing plot3.R, but this is clearer
png(filename="plot4.png")
plot_all()
dev.off()


