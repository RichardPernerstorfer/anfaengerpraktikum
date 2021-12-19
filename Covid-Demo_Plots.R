# Datensätze erstellen
data_CovidDemo_germany <- subset(RKI_COVID19, Meldedatum >= "2020-08-12" & Meldedatum <= "2020-11-12" )
data_CovidDemo_bayern <- subset(data_CovidDemo_germany, IdBundesland == "9" )
data_CovidDemo_muenchen <- subset(data_CovidDemo_bayern, Landkreis == "SK München")
data_CovidDemo_bayern_ohne_muenchen  <- subset(data_CovidDemo_bayern, Landkreis != "SK München")
data_CovidDemo_germany <- aggregate(data_CovidDemo_germany$AnzahlFall, data_CovidDemo_germany[9], sum)
data_CovidDemo_bayern <- aggregate(data_CovidDemo_bayern$AnzahlFall, data_CovidDemo_bayern[9], sum)
data_CovidDemo_muenchen <- aggregate(data_CovidDemo_muenchen$AnzahlFall, data_CovidDemo_muenchen[9], sum)
data_CovidDemo_bayern_ohne_muenchen <- aggregate(data_CovidDemo_bayern_ohne_muenchen$AnzahlFall, data_CovidDemo_bayern_ohne_muenchen[9], sum)
data_CovidDemo_muenchen$anteil <- data_CovidDemo_muenchen$x / data_CovidDemo_bayern$x
divi_CovidDemo <- subset(divi_17_11,date >= "2020-08-12" & date <= "2020-11-12" & bundesland == "09" )
divi_muenchen <- subset(divi_CovidDemo, gemeindeschluessel == "09162")
divi_muenchen <- aggregate(divi_muenchen$faelle_covid_aktuell_invasiv_beatmet, divi_muenchen[1], sum)
divi_CovidDemo <- aggregate(divi_CovidDemo$faelle_covid_aktuell_invasiv_beatmet, divi_CovidDemo[1], sum)
divi_CovidDemo$invasiv_anteil <- divi_muenchen$x / divi_CovidDemo$x

# Fälle CovidDemo München
CovidDemo_muenchen_plot <- ggplot(data = data_CovidDemo_muenchen, aes(x = Meldedatum, y = x / 14.72)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die Corona-Demo in München") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))


# Fälle CovidDemo Bayern ohne München 
CovidDemo_bayern_ohne_muenchen_plot <- ggplot(data = data_CovidDemo_bayern_ohne_muenchen, aes(x = Meldedatum, y = x / 130.8)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die Corona-Demo in Rest-Bayern") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))


#Zusammenhängende Grafik
ggarrange(CovidDemo_muenchen_plot, CovidDemo_bayern_ohne_muenchen_plot, nrow = 2)

# Fälle CovidDemo Anteil München an Bayern
ggplot(data = data_CovidDemo_muenchen, aes(y = anteil, x = Meldedatum)) + 
  geom_line(size = 2, color = "black") +
  labs(x = "Datum", y = "Anteil der Covid-Infektionen", title = "Anteil der münchner Covid-Infektionen an Bayern um die Corona-Demo") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 27)) +
  ylim(0, NA)

# belegte Intensivbetten Prozent
ggplot(data = divi_CovidDemo, aes(x = date, y = invasiv_anteil)) +
  geom_line(stat="identity", size = 2) + 
  labs(x = "Datum", y = "Anteil der invasiv-beatmeten\nCovid-Patienten", title = "Anteil der invasiv-beatmeten Covid-Patienten Münchens an Bayern um die Corona-Demo") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-26")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 27)) +
  ylim(0, NA)

# datensätze vernichten
divi_CovidDemo <- NULL
divi_muenchen <- NULL
data_CovidDemo_germany <- NULL
data_CovidDemo_bayern <- NULL
data_CovidDemo_muenchen <- NULL
data_CovidDemo_bayern_ohne_muenchen <- NULL
