mydata <- Aktuell_Deutschland_COVID_19_Hospitalisierungen
colnames(mydata) <- c("A", "B", "C", "D", "E", "F")
mydata <- data.frame(mydata$A, mydata$E)
mydata <- aggregate(mydata$mydata.E, mydata[1], sum)
mydata <- mydata[-c(1:54),]
mydata <- mydata[-c(574:648),]
mydata2 <- aggregate(divi_17_11$faelle_covid_aktuell,divi_17_11[1], sum)
mydata3 <- mydata
mydata3$x <- mydata2$x/mydata$x
ggplot(mydata3, mapping = aes(x = mydata.A, y = x))+
  geom_bar(stat = "identity", width = 1) +
  ggtitle("Hospitalisierungen pro Covid-Fälle") +
  xlab("Datum") + ylab("Anteil an Hospitalisierungen")