# This code plots a decorative heart birthday card image.
# It uses a parametric equation to create the X and Y values of the heart shape.
# It's based on this tutorial: https://stackoverflow.com/questions/8082429/plot-a-heart-in-r

dat <- data.frame(t=seq(0, 2*pi, by=0.1) )
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
dat$y=yhrt(dat$t)
dat$x=xhrt(dat$t)

text.x <- runif(20, -14, 14)
text.y <- runif(20, -14, 14)

cast <- c("Trash","Viscious","Roman","Neil")
cast.cols <- c("blue","purple","slateblue3","mediumorchid4")

png("Happy_birthday_Viscious_Von_Vixens_Vaudeville.png",h=6,w=6,unit="in",res=300)
with(dat, plot(x,y, col="black",xlab="",ylab="",axes=F,pch=20))
with(dat, polygon(x,y, col="hotpink"))
text(x=text.x,y=text.y, cast, font=2,col=cast.cols)
axis(1,-15:15,rep("♥",31),col=c("hotpink","black"))
axis(2,-15:15,rep("♥",31),col=c("hotpink","black"))
title(main=list("Happy birthday!",cex=2,font=3))
dev.off()
