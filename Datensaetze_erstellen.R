### Daten einlesen

library(readr)


##  Divi Datensatz

divi_17_11<- read_csv("DIVI-Intensivregister_2021-11-17_12-15.csv")

### Datensatz überprüfen

fehlendeWerte <- table(is.na(divi_17_11))
fehlendeWerte[[TRUE]]  # Beachtung bei Berechnungen


### Neue Spalte betten_anteil gibt prozentualen Anteil der belegten Betten


divi_17_11$betten_anteil <- divi_17_11$betten_belegt / (divi_17_11$betten_frei + divi_17_11$betten_belegt)


### Datensätze allgemein

data_bayern <- subset(divi_17_11, bundesland == "09")
data_bayern_ohne_muenchen <- subset(divi_17_11, bundesland == "09" & gemeindeschluessel != "09162")
data_deutschland_ohne_bayern <- subset(divi_17_11, bundesland != "09")
data_muenchen <- subset(data_bayern, gemeindeschluessel == "09162")


### Neue Spalte faelle_covid_anteil gibt prozentualen Anteil von Corona Infizierten zur Gesasamtbevölkerung Münchens
## Zahl der Bevölkerung aus https://de.wikipedia.org/wiki/M%C3%BCnchen (Zuletzt aufgerufen 23.11.2021)

data_muenchen$faelle_covid_anteil <- data_muenchen$faelle_covid_aktuell / 1488202  # Stand: 31. Dez. 2020

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

data_CorDemo_germany <- subset(divi_17_11, date >= "2020-08-01" &  date <= "2020-11-30")
data_CorDemo_muenchen <- subset(data_muenchen, date >= "2020-08-01" &  date <= "2020-11-30" )
data_CorDemo_bayern <- subset(data_bayern, date >= "2020-08-01" &  date <= "2020-11-30")
data_CorDemo_bayern_ohne_muenchen <- subset(data_bayern_ohne_muenchen, date >= "2020-08-01" &  date <= "2020-11-30")


### Datensatz Black Lives Matter Demonstration 

data_BLM_germany <- subset(divi_17_11, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_bayern <- subset(data_bayern, date >= "2020-05-11" & date <= "2020-08-06" )
data_BLM_muenchen <- subset(data_muenchen, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_bayern_ohne_muenchen  <- subset(data_bayern_ohne_muenchen, date >= "2020-05-06" & date <= "2020-05-06" )


## Gelsenkirchen

data_nordrheinwestfalen <- subset(divi_17_11, bundesland == "05")
data_gelsenkirchen <- subset(data_nordrheinwestfalen, gemeindeschluessel == "05513")
data_gelsenkirchen$faelle_covid_anteil <- data_gelsenkirchen$faelle_covid_aktuell/262073
data_BLM_gelsenkirchen <- subset(data_gelsenkirchen, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_gelsenkirchen_muenchen <- rbind(data_BLM_muenchen,data_BLM_gelsenkirchen)

## Passau

data_passau <- subset(data_bayern, gemeindeschluessel == "09262")
data_passau$faelle_covid_anteil <- data_passau$faelle_covid_aktuell/52469
data_BLM_passau <- subset(data_passau, date >= "2020-05-06" & date <= "2020-08-06")
data_BLM_alle_städte <- rbind(data_BLM_gelsenkirchen_muenchen, data_BLM_passau)
