library(ggplot2)


x = 1:10000/100
sinx = sin(x)
fftsinx = abs(fft(sinx))
df = data.frame(x=x,sinx=sinx,fftsinx=fftsinx)
ggplot(df,aes(x=x,y=sinx))+geom_point()



ggplot(df,aes(x=(x*100/2)/(10000/2),y=fftsinx))+geom_point()+theme_bw()+xlim(0,1)



getDfFFT <- function(f,low,high,step){
	x = c(low:(high/step))*step
  fnx = f(x)
  fftFnx = abs(fft(fnx))
	xCoord = (x * (0.5/step))/(length(x)/2)
	data.frame(x=x,xCoord=xCoord,fnx=fnx,fftFnx=fftFnx)
}


fft.df = getDfFFT(f=sin,low=0,high=10,step=0.1)

