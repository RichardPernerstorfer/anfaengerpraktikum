library(ggplot2)
### Anteil München an Bayern

plot_anteil_muenchen_bayern <- ggplot( data = data_BLM_muenchen, aes(x = date, y = anteil)) +
  geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "pink", size = 1)
plot_anteil_muenchen_bayern

### Absolute Infektionszahlen München

plot_BLM_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Aktuelle Covid-Fälle zwischen Mai und August in München 2020") +
  xlab("Datum") + ylab("aktuelle Covid-Fälle") + geom_bar(stat="identity") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_BLM_muenchen


### Belegte Betten München

plot_betten_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = betten_belegt)) +
  ggtitle("Belegte Betten zwischen Mai und August 2020 in München ") +
  xlab("Datum") + ylab("Belegte Betten") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_betten_muenchen


### Anteilige Infektionzahlen an Einwohnerzahl Muenchen

plot_rel_BLM_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_anteil)) +
  ggtitle("Anteil Covid-Fälle zwischen Mai und August in München 2020") +
  xlab("Datum") + ylab("Anteil aktueller Covid-Fälle") + geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_rel_BLM_muenchen


### Absolute Infektionszahlen Bayern

plot_BLM_bayern <- ggplot(data = data_BLM_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("AktuelleCovid-Fälle zwischen Mai und August in Bayern 2020") +
  xlab("Datum") + ylab("Aktuelle Covid-Fälle") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_BLM_bayern


### Absolute Infektionszahlen Deutschland

plot_BLM_germany <- ggplot(data = data_BLM_germany, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Aktuelle Covid-Fälle zwischen Mai und August in Deutschland 2020") +
  xlab("Datum") + ylab("Aktuelle Covid-Fälle") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_BLM_germany


### Absolut Betten Belegung Bayern

plot_betten_bayern <- ggplot(data = data_BLM_bayern, aes(x = date, y = betten_belegt)) +
  ggtitle("Belegte Betten zwischen Mai und August 2020 in Bayern ") +
  xlab("Datum") + ylab("Belegte Betten") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_betten_bayern


### Anteil Betten Belegung Bayern

plot_rel_betten_bayern <- ggplot(data = data_BLM_bayern, aes(x = date, y = betten_anteil)) +
  ggtitle("Belegte Betten zwischen Mai und August 2020 in Bayern ") +
  xlab("Datum") + ylab("Anteil belegter Betten") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_rel_betten_bayern



### Vergleich Gelsenkirchen-Muenchen

### Absolute Infektionszahlen

plot_gelsenkirchen_muenchen <- ggplot(data = data_BLM_gelsenkirchen_muenchen, aes(x = date, y = faelle_covid_aktuell, col = bundesland)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_gelsenkirchen_muenchen


### Anteil Infektionszahlen an Einwohneranzahl beider Städte

plot_rel_gelsenkirchen_muenchen <- ggplot(data = data_BLM_gelsenkirchen_muenchen, aes(x = date, y = faelle_covid_anteil, col = bundesland)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_rel_gelsenkirchen_muenchen


plot_betten <-  ggplot(data = data_BLM_gelsenkirchen_muenchen, aes(x = bundesland, y = betten_anteil, col = bundesland)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_boxplot() 
plot_betten


### Vergleich Passau, München, Gelsenkirchen

plot_rel_gelsenkirchen_muenchen_passau <- ggplot(data = data_BLM_alle_städte, aes(x = date, y = faelle_covid_anteil, col = gemeindeschluessel)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_bar(stat = "identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 0.25)

plot_rel_gelsenkirchen_muenchen_passau



### Vergleich Betten Passau,München,Gelsenkirchen

plot_betten_gelsenkirchen_muenchen_passau <- ggplot(data = data_BLM_alle_städte, aes(x = date, y = betten_anteil, col = gemeindeschluessel)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_line(size = 0.5) +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 0.25)

plot_betten_gelsenkirchen_muenchen_passau


plot_gelsenkirchen_muenchen_passau <- ggplot(data = data_BLM_alle_städte, aes(x = date, y = faelle_covid_aktuell, col = gemeindeschluessel)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_gelsenkirchen_muenchen_passau

plot_gelsenkirchen_muenchen_passau
