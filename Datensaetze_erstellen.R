### Daten einlesen

library(readr)
divi_03_11<- read_csv("DIVI-Intensivregister-2021-11-03-12-15.csv")

### Neue Spalte betten_anteil gibt prozentualen Anteil der belegten Betten

divi_03_11$betten_anteil <- divi_03_11$betten_belegt / (divi_03_11$betten_frei + divi_03_11$betten_belegt)

### Datensätze allgemein

data_bayern <- subset(divi_03_11, bundesland == "09")
data_bayern_ohne_muenchen <- subset(divi_03_11, bundesland == "09", gemeindeschluessel != "09162")
data_deutschland_ohne_bayern <- subset(divi_03_11, bundesland != "09")
data_muenchen <- subset(data_bayern, gemeindeschluessel == "09162")

### Datensatz IAA Deutschlandweit

data_IAA_germany <- subset(divi_03_11, date >= "2021-08-07" & date <= "2021-11-12" )
data_IAA_bayern <- subset(data_bayern, date >= "2021-08-07" & date <= "2021-11-12" )
data_IAA_muenchen <- subset(data_muenchen, date >= "2021-08-07" & date <= "2021-11-12" )