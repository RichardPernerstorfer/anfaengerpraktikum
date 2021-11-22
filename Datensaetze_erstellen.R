### Daten einlesen

library(readr)

## Altes Divi Datensatz

divi_03_11<- read_csv("DIVI-Intensivregister-2021-11-03-12-15.csv")

## Neues Divi Datensatz

divi_17_11<- read_csv("DIVI-Intensivregister_2021-11-17_12-15.csv")

### Neue Spalte betten_anteil gibt prozentualen Anteil der belegten Betten

divi_03_11$betten_anteil <- divi_03_11$betten_belegt / (divi_03_11$betten_frei + divi_03_11$betten_belegt)

divi_17_11$betten_anteil <- divi_17_11$betten_belegt / (divi_17_11$betten_frei + divi_17_11$betten_belegt)

### Datensätze allgemein

data_bayern <- subset(divi_17_11, bundesland == "09")
data_bayern_ohne_muenchen <- subset(divi_17_11, bundesland == "09", gemeindeschluessel != "09162")
data_deutschland_ohne_bayern <- subset(divi_17_11, bundesland != "09")
data_muenchen <- subset(data_bayern, gemeindeschluessel == "09162")

### Datensatz IAA Deutschlandweit

data_IAA_germany <- subset(divi_17_11, date >= "2021-08-07" & date <= "2021-11-12" )
data_IAA_bayern <- subset(data_bayern, date >= "2021-08-07" & date <= "2021-11-12" )
data_IAA_muenchen <- subset(data_muenchen, date >= "2021-08-07" & date <= "2021-11-12" )
data_IAA_bayern_ohne_muenchen  <- subset(data_bayern_ohne_muenchen, date >= "2021-08-07" & date <= "2021-11-12" )

### Datensatz Corona Demonstration

data_bayern$date <-as.Date(data_bayern$date, format = "%Y-%m-%d")

data_bayern_aug <- subset(data_bayern, date >= "2020-08-01" & date <= "2020-08-31" )
data_muc_aug <- subset(data_bayern_aug, gemeindeschluessel == "09162")

data_bayern_sep <- subset(data_bayern, date >= "2020-09-01" & date <= "2020-09-30" )
data_muc_sep <- subset(data_bayern_sep, gemeindeschluessel == "09162")

data_bayern_oct <- subset(data_bayern, date >= "2020-10-01" & date <= "2020-10-31" )
data_muc_oct <- subset(data_bayern_oct, gemeindeschluessel == "09162")

data_bayern_nov <- subset(data_bayern, date >= "2020-11-01" & date <= "2020-11-30")
data_muc_nov <- subset(data_bayern_nov, gemeindeschluessel == "09162")

### Datensätze EM
##Datensatz EM alle 4 Monate  
data_bayern_EM<-subset(data_bayern,date>="2021-05-11"&date<="2021-09-11")
data_muenchen_EM<-subset(data_muenchen,date>="2021-05-11"&date<="2021-09-11")
data_bayern_ohne_Muc_EM<-subset(data_bayern_ohne_Muc,date>="2021-05-11"&date<="2021-09-11")

###Datensatz EM monatlich getrennt
##Bayern
data_bayern_EM_5<-subset(data_bayern,date>="2021-05-11"&date<="2021-06-11")
data_bayern_EM_6<-subset(data_bayern,date>="2021-06-11"&date<="2021-07-11")
data_bayern_EM_7<-subset(data_bayern,date>="2021-07-11"&date<="2021-08-11")
data_bayern_EM_8<-subset(data_bayern,date>="2021-08-11"&date<="2021-09-11")

## Muenchen
data_muenchen_EM_5<-subset(data_muenchen,date>="2021-05-11"&date<="2021-06-11")
data_muenchen_EM_6<-subset(data_muenchen,date>="2021-06-11"&date<="2021-07-11")
data_muenchen_EM_7<-subset(data_muenchen,date>="2021-07-11"&date<="2021-08-11")
data_muenchen_EM_8<-subset(data_muenchen,date>="2021-08-11"&date<="2021-09-11")

##Bayern ohne Muenchen

data_bayern_ohne_muenchen_EM_5<-subset(data_bayern_ohne_Muc,date>="2021-05-11"&date<="2021-06-11")
data_bayern_ohne_muenchen_EM_6<-subset(data_bayern_ohne_Muc,date>="2021-06-11"&date<="2021-07-11")
data_bayern_ohne_muenchen_EM_7<-subset(data_bayern_ohne_Muc,date>="2021-07-11"&date<="2021-08-11")
data_bayern_ohne_muenchen_EM_8<-subset(data_bayern_ohne_Muc,date>="2021-08-11"&date<="2021-09-11")

