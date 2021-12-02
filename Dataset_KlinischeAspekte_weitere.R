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















