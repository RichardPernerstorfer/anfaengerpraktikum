Einwohner = c(2896712,1841179,7982448,682986,17932651,6265809,4084844,11069533,13076721,990509,3644826,2511917,1609675,4077937,2208321,2143145)
Datumz = unique(divi_17_11$date)
ergebniss1=c()
ergebniss2=c()
ergebniss3=c()
for(i in 1:length(Datumz)){
  for(j in 1:16){
    bl = "0"
    if(j<=9){
      bl = paste("0",as.character(j),sep = "")
    }else{
      bl = as.character(j)
    }
    a = subset(divi_17_11, date == Datumz[i] ||  bundesland==bl)
    b = sum(a$faelle_covid_aktuell)/Einwohner[j]
    ergebniss1 = c(ergebniss1,b)
    ergebniss2 = c(ergebniss2,bl)
    ergebniss3 = c(ergebniss3,paste(Datumz[i]))
    
  }
}
test = cbind(ergebniss3,ergebniss2,ergebniss1)

