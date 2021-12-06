### Datensatz für die Inzidenzen der einzelnen Bundesländer (Faelle_aktuell/Einwohnerzahl) * 100000

Einwohner <- c(2896712,1841179,7982448,682986,17932651,6265809,4084844,11069533,13076721,990509,3644826,2511917,1609675,4077937,2208321,2143145)
Datum <- unique(divi_17_11$date)
dates <- c()
bundeslaender <- c()
inzidenz <- c()
for(i in 1:length(Datum)){
  for(j in 1:16){
    bl <- "0"
    if(j<=9){
      bl <- paste("0",as.character(j),sep = "")
    }else{
      bl <- as.character(j)
    }
    a <- subset(divi_17_11, date == Datum[i])
    b <- subset(a, bundesland == bl)
    c <- (sum(b$faelle_covid_aktuell)/Einwohner[j]) *100000
    
    dates <- c(dates,paste(Datum[i]))
    bundeslaender <- c(bundeslaender,bl)
    inzidenz <- c(inzidenz,c)
    
  }
}

inzidenz_bundeslaender <- cbind(dates, bundeslaender,inzidenz)
inzidenz_bundeslaender <- as.data.frame(inzidenz_bundeslaender)

inzidenz_bundeslaender <- inzidenz_bundeslaender[order( inzidenz_bundeslaender[,2] ),]
inzidenz_bundeslaender[,1] <- as.Date(bundesländer_inzidenz[,1], "%Y-%m-%d")
inzidenz_bundeslaender[,3] <- as.numeric(inzidenz_bundeslaender[,3])


inzidenz_bayern_germany <- subset(inzidenz_bundeslaender, bundeslaender == "09")

inzidenz_bayern_germany$germany <- as.vector(unlist((aggregate(divi_17_11$faelle_covid_aktuell, divi_17_11[1], sum)[2]) / 83240000) * 100000)


 ggplot(data =test34, aes(x = ergebniss3, y = ergebniss1, group = ergebniss2)) +
       geom_line(alpha = 0.5) +
       scale_x_date(date_breaks = "4 week", date_labels = "%b %d") +
   geom_line(data = new, aes( x = ergebniss3, y = ergebniss1, colour = "red"), size = 1.5) +
   geom_line(data = new, aes(x = ergebniss3, y = germany, colour = "blue"), size = 1.5)
   
   
