

set.seed(42542)
x = rnorm(10000)

require("extrafont")
loadfonts(device = "postscript")
ps.options(fonts="Arial")


for (iter in 1:2){
  if (iter==2){
    setEPS()
    postscript("example_latex_histogram_plot.eps", height = 6, width = 6.83,
             family = "Arial", paper = "special", onefile = FALSE,
             horizontal = FALSE)
  }

  a = hist(x,plot=F)
  ymax = 1.1*max(a$counts)
  plot(a,ylim=c(0,ymax),xaxs="i",yaxs="i",main="",xlab="Histogram of Normally distributed data")
  u = par("usr")
  
  acol = "cornsilk"
  rect(u[1], u[3], u[2], u[4], col=acol,border=acol)
  plot(a,col="red4",add=T,xaxs="i",yaxs="i",main="")

  if (iter==2) dev.off()
}

m = paste("\\newcommand{\\yearmin}{$",1995,"$}",sep="")
n = paste("\\newcommand{\\yearmax}{$",2018,"$}",sep="")
p = paste("\\newcommand{\\StdDeviationOfData}{$",round(sd(x),3),"$}",sep="")
cat("\n")
cat(m,"\n")
cat(n,"\n")
cat(p,"\n")
cat("\n")


