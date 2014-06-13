library(ggplot2)

df = read.table("../data/NYC_6min.tab")

colnames(df) <- c("Station","Date","Time","Pred","Vrfy")

df$time = seq_along(df$Vrfy)
df$year = substr(paste0(df$Date),0,4)


ggplot(df[which(df$year == "2000"),],aes(x=time,y=Vrfy))+geom_line() + theme_bw()+xlim(0,10000)


ft = fft(df$Vrfy)




ftr = fft(head(ft,1000),inverse=TRUE)


