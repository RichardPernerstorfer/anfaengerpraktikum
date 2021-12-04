# Geschlecht Plot

## RKI Datensatz Bayern runterladen

install.packages("vroom")
library(vroom)

rki_bayern_data <- vroom('RKI_COVID19_Bayern.zip')

## Nach Datum sortieren
rki_bayern_data[order(as.Date(rki_bayern_data$Meldedatum, format="%Y/%m/%d")),]



## Plot
library(ggplot2)
color_code<-c("M"="blue",
              "W"="pink")


ggplot(data = rki_bayern_data) + aes(x = Altersgruppe, fill = factor(Geschlecht, levels = c("M", "W", "unbekannt"))) + 
  geom_bar(position = 'dodge') +
  scale_fill_manual(values = c("steelblue2", "palevioletred2", "grey40")) +
  ggtitle("Einteilung der Covid-Infizierten nach Geschlecht in verschiedenen Altersgruppen") +
  ylab("Anzahl der Covid Infizierten je nach Geschlecht") +
  labs(fill = 'Geschlecht')


