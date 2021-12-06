### Daten einlesen

library(readr)


##  Divi Datensatz

divi_17_11 <- read_csv("DIVI-Intensivregister_2021-11-17_12-15.csv")

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
data_IAA_muenchen$anteil <- data_IAA_muenchen$faelle_covid_aktuell / as.vector(unlist(aggregate(data_IAA_bayern$faelle_covid_aktuell, data_IAA_bayern[1], sum)[2]))

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

data_CorDemo_germany <- subset(divi_17_11, date >= "2020-08-12" &  date <= "2020-11-12")
data_CorDemo_muenchen <- subset(data_muenchen, date >= "2020-08-12" &  date <= "2020-11-12" )
data_CorDemo_bayern <- subset(data_bayern, date >= "2020-08-12" &  date <= "2020-11-12")
data_CorDemo_bayern_ohne_muenchen <- subset(data_bayern_ohne_muenchen, date >= "2020-08-12" &  date <= "2020-11-12")


### Datensatz Black Lives Matter Demonstration 

data_BLM_germany <- subset(divi_17_11, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_bayern <- subset(data_bayern, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_muenchen <- subset(data_muenchen, date >= "2020-05-06" & date <= "2020-08-06" )
data_BLM_bayern_ohne_muenchen  <- subset(data_bayern_ohne_muenchen, date >= "2020-05-06" & date <= "2020-05-06" )


### Anteil München an Bayern
data_BLM_muenchen$anteil <- data_BLM_muenchen$faelle_covid_aktuell / as.vector(unlist(aggregate(data_BLM_bayern$faelle_covid_aktuell, data_BLM_bayern[1], sum)[2]))


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
data_BML_alle_städte <- rbind(data_BLM_gelsenkirchen_muenchen, data_BLM_passau)

#Allgemein


## Impfstoff Data

vaccination_timeseries <- read.table(file='germany_vaccinations_timeseries_v2.tsv')

## Spaltennamen Änderung
colnames(vaccination_timeseries) <- as.character(vaccination_timeseries[1,])
vaccination_timeseries <- vaccination_timeseries[-1, ]

## Formatierung Date
myformat2<-"%Y-%m-%d"
vaccination_timeseries$date<-as.Date(vaccination_timeseries$date,myformat2)
View(vaccination_timeseries)



## RKI Datensatz Bayern

install.packages("vroom")
library(vroom)

rki_bayern_data <- vroom('RKI_COVID19_Bayern.zip')

## Nach Datum sortieren
rki_bayern_data[order(as.Date(rki_bayern_data$Meldedatum, format="%Y/%m/%d")),]

# Klinische Aspekte und andere Datensaetze umstrukturieren und schön gestalten

library(rio)
library(dplyr)
library(stringr)
library(tidyr)
data_list <- import_list("Klinische_Aspekte.xlsx", setclass = "tb1")

## Unlist all dataframes

list2env(data_list, .GlobalEnv)



####### Data umstrukturieren:



## 1. Klinische_Aspekte

as.data.frame(Klinische_Aspekte) 

# Spalten Namen Änderung
colnames(Klinische_Aspekte) <- as.character(Klinische_Aspekte[2,])
colnames(Klinische_Aspekte) <- gsub(colnames(Klinische_Aspekte), pattern = " ", replacement = "_")
colnames(Klinische_Aspekte) <- gsub(colnames(Klinische_Aspekte), pattern = "ä", replacement = "ae")
colnames(Klinische_Aspekte) <- gsub(colnames(Klinische_Aspekte), pattern = "(", replacement = "", fixed = TRUE)
colnames(Klinische_Aspekte) <- gsub(colnames(Klinische_Aspekte), pattern = ")", replacement = "", fixed = TRUE)

# unnötige Reihen löschen
Klinische_Aspekte <- filter(Klinische_Aspekte, MW != "0")
Klinische_Aspekte <- filter(Klinische_Aspekte, MW != "MW")

# Umwandeln

Klinische_Aspekte$Maenner <- as.numeric(Klinische_Aspekte$Maenner)
Klinische_Aspekte$Frauen <- as.numeric(Klinische_Aspekte$Frauen)




## 2. 7-Tage-Inzidenz_Hosp_Alter

as.data.frame('7-Tage-Inzidenz_Hosp_Alter')

## Spaltennamen änderen
colnames(`7-Tage-Inzidenz_Hosp_Alter`) <- as.character(`7-Tage-Inzidenz_Hosp_Alter`[3,])
colnames(`7-Tage-Inzidenz_Hosp_Alter`) <- gsub(colnames(`7-Tage-Inzidenz_Hosp_Alter`), pattern = " ", replacement = "_")

## unnötige Reihen löschen
`7-Tage-Inzidenz_Hosp_Alter` <- `7-Tage-Inzidenz_Hosp_Alter`[-c(1:3),] 





## 3. Alter_Median_Mittelwert

as.data.frame(Alter_Median_Mittelwert) 

colnames(Alter_Median_Mittelwert) <- as.character(Alter_Median_Mittelwert[3,])
colnames(Alter_Median_Mittelwert) <- gsub(colnames(Alter_Median_Mittelwert), pattern = " ", replacement = "_", fixed = TRUE)
colnames(Alter_Median_Mittelwert) <- gsub(colnames(Alter_Median_Mittelwert), pattern = "ä", replacement = "ae")


## Reihen entfernen
Alter_Median_Mittelwert <- Alter_Median_Mittelwert[-c(1:3),] 

## NA spalten löschen
Alter_Median_Mittelwert <- Alter_Median_Mittelwert[,colSums(is.na(Alter_Median_Mittelwert)) < nrow(Alter_Median_Mittelwert)]

## Extra Spalten löschen
Alter_Median_Mittelwert$Meldejahr.1 <- NULL
Alter_Median_Mittelwert$Meldewoche.1 <- NULL





## 4. Fälle_Hospitialisierung_Alter

 as.data.frame(Fälle_Hospitalisierung_Alter)

## Spalten umbenennen
colnames(Fälle_Hospitalisierung_Alter) <- c("Meldejahr", "Meldewoche", "A0_bis_A4", "A5_bis_A15", "A15_bis_A34", "A35_bis_A59", "A60_bis_A79", "A80_plus", "date")
Fälle_Hospitalisierung_Alter$A0_bis_A4 <- as.numeric(Fälle_Hospitalisierung_Alter$A0_bis_A4)
Fälle_Hospitalisierung_Alter$A5_bis_A15 <- as.numeric(Fälle_Hospitalisierung_Alter$A5_bis_A15)
Fälle_Hospitalisierung_Alter$A15_bis_A34 <- as.numeric(Fälle_Hospitalisierung_Alter$A15_bis_A34)
Fälle_Hospitalisierung_Alter$A35_bis_A59 <- as.numeric(Fälle_Hospitalisierung_Alter$A35_bis_A59)
Fälle_Hospitalisierung_Alter$A60_bis_A79 <- as.numeric(Fälle_Hospitalisierung_Alter$A60_bis_A79)
Fälle_Hospitalisierung_Alter$A80_plus <- as.numeric(Fälle_Hospitalisierung_Alter$A80_plus)
Fälle_Hospitalisierung_Alter$Meldejahr <- as.numeric(Fälle_Hospitalisierung_Alter$Meldejahr)
Fälle_Hospitalisierung_Alter$Meldewoche <- as.numeric(Fälle_Hospitalisierung_Alter$Meldewoche)
Fälle_Hospitalisierung_Alter$A5_bis_A15[17] <- 0
## Reihen löschen
Fälle_Hospitalisierung_Alter <- Fälle_Hospitalisierung_Alter[-c(1:4), ]






## 5. Todesfälle_Alter_Geschlecht

as.data.frame(Todesfälle_Alter_Geschlecht)

# Spaltennamen
colnames(Todesfälle_Alter_Geschlecht) <- Todesfälle_Alter_Geschlecht[4,]

## Reihen löschen
Todesfälle_Alter_Geschlecht <- Todesfälle_Alter_Geschlecht[-c(1:4),]

Todesfälle_Alter_Geschlecht[,2] <- as.factor(Todesfälle_Alter_Geschlecht[,2])
Todesfälle_Alter_Geschlecht[,3] <- as.factor(Todesfälle_Alter_Geschlecht[,3])
Todesfälle_Alter_Geschlecht[,4] <- as.factor(Todesfälle_Alter_Geschlecht[,4])
Todesfälle_Alter_Geschlecht[,5] <- as.factor(Todesfälle_Alter_Geschlecht[,5])
Todesfälle_Alter_Geschlecht[,6] <- as.factor(Todesfälle_Alter_Geschlecht[,6])
Todesfälle_Alter_Geschlecht[,7] <- as.factor(Todesfälle_Alter_Geschlecht[,7])
Todesfälle_Alter_Geschlecht[,8] <- as.factor(Todesfälle_Alter_Geschlecht[,8])
Todesfälle_Alter_Geschlecht[,9] <- as.factor(Todesfälle_Alter_Geschlecht[,9])
Todesfälle_Alter_Geschlecht[,10] <- as.factor(Todesfälle_Alter_Geschlecht[,10])
Todesfälle_Alter_Geschlecht[,11] <- as.factor(Todesfälle_Alter_Geschlecht[,11])




