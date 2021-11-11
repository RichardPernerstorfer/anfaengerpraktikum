
library(rio)
data_list <-import_list("Klinische_Aspekte.xlsx", setclass = "tb1")

## Unlist all dataframes

list2env(data_list, .GlobalEnv)

## Data umstrukturieren:

## 1. Klinische_Aspekte

as.data.frame(Klinische_Aspekte) 

colnames(Klinische_Aspekte) <- as.character(Klinische_Aspekte[2,])
Klinische_Aspekte <- Klinische_Aspekte[-c(1:2),] 

## 2. 7-Tage-Inzidenz_Hosp_Alter

as.data.frame(`7-Tage-Inzidenz_Hosp_Alter`)
colnames(`7-Tage-Inzidenz_Hosp_Alter`) <- as.character(`7-Tage-Inzidenz_Hosp_Alter`[3,])
`7-Tage-Inzidenz_Hosp_Alter`<- `7-Tage-Inzidenz_Hosp_Alter`[-c(1:3),]


## 3. Alter_Median_Mittelwert

as.data.frame(Alter_Median_Mittelwert) 
colnames(Alter_Median_Mittelwert) <- as.character(Alter_Median_Mittelwert[3,])
Alter_Median_Mittelwert <- Alter_Median_Mittelwert[-c(1:3),] 

Alter_Median_Mittelwert <- Alter_Median_Mittelwert[,colSums(is.na(Alter_Median_Mittelwert)) < nrow(Alter_Median_Mittelwert)]
Alter_Median_Mittelwert$Meldejahr.1 <- NULL
Alter_Median_Mittelwert$Meldewoche.1 <- NULL

## 4. Fälle_Hospitialisierung_Alter

as.data.frame(Fälle_Hospitalisierung_Alter)
colnames(Fälle_Hospitalisierung_Alter) <- Fälle_Hospitalisierung_Alter[4,]
Fälle_Hospitalisierung_Alter <- Fälle_Hospitalisierung_Alter[-c(1:4), ]
Fälle_Hospitalisierung_Alter

## 5. Todesfälle_Alter_Geschlecht

as.data.frame(Todesfälle_Alter_Geschlecht)
colnames(Todesfälle_Alter_Geschlecht) <- Todesfälle_Alter_Geschlecht[4,]
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

Todesfälle_Alter_Geschlecht[,2] <- as.factor(Todesfälle_Alter_Geschlecht[,2])Hosp1 <- table(`7-Tage-Inzidenz_Hosp_Alter`[["Meldewoche"]], `7-Tage-Inzidenz_Hosp_Alter`[["Inzidenz A00..04"]])
Hosp1


Todesfälle_Alter_Geschlecht %>% filter(Geschlecht == "männlich") %>% 
  ggplot(Todesfälle_Alter_Geschlecht, mapping = aes(x = männlich  )) + geom_bar()





