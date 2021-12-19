# Datensätze erstellen
data_BLM_germany <- subset(RKI_COVID19, Meldedatum >= "2020-05-06" & Meldedatum <= "2020-08-06" )
data_BLM_bayern <- subset(data_BLM_germany, IdBundesland == "9" )
data_BLM_muenchen <- subset(data_BLM_bayern, Landkreis == "SK München")
data_BLM_bayern_ohne_muenchen  <- subset(data_BLM_bayern, Landkreis != "SK München")
data_BLM_germany <- aggregate(data_BLM_germany$AnzahlFall, data_BLM_germany[9], sum)
data_BLM_bayern <- aggregate(data_BLM_bayern$AnzahlFall, data_BLM_bayern[9], sum)
data_BLM_muenchen <- aggregate(data_BLM_muenchen$AnzahlFall, data_BLM_muenchen[9], sum)
data_BLM_muenchen <- rbind(data_BLM_muenchen, c("2020-06-01", 0))
data_BLM_muenchen <- data_BLM_muenchen[order(data_BLM_muenchen[,1]),]
data_BLM_bayern_ohne_muenchen <- aggregate(data_BLM_bayern_ohne_muenchen$AnzahlFall, data_BLM_bayern_ohne_muenchen[9], sum)
data_BLM_muenchen$x <- as.numeric(data_BLM_muenchen$x)
data_BLM_muenchen$anteil <- data_BLM_muenchen$x / data_BLM_bayern$x
divi_BLM <- subset(divi_17_11,date >= "2020-05-06" & date <= "2020-08-06" & bundesland == "09" )
divi_muenchen <- subset(divi_BLM, gemeindeschluessel == "09162")
divi_muenchen <- aggregate(divi_muenchen$faelle_covid_aktuell_invasiv_beatmet, divi_muenchen[1], sum)
divi_BLM <- aggregate(divi_BLM$faelle_covid_aktuell_invasiv_beatmet, divi_BLM[1], sum)
divi_BLM$invasiv_anteil <- divi_muenchen$x / divi_IAA$x

# Fälle IAA München
BLMM_muenchen_plot <- ggplot(data = data_BLM_muenchen, aes(x = Meldedatum, y = x / 14.72)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die BLM-Demo in München") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))


# Fälle IAA Bayern ohne München 
BLM_bayern_ohne_muenchen_plot <- ggplot(data = data_BLM_bayern_ohne_muenchen, aes(x = Meldedatum, y = x / 130.8)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die BLM-Demo in Rest-Bayern") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))

#Zusammenhängende Grafik
ggarrange(BLM_muenchen_plot, BLM_bayern_ohne_muenchen_plot, nrow = 2)

# Fälle IAA Anteil München an Bayern
ggplot(data = data_BLM_muenchen, aes(y = anteil, x = Meldedatum)) + 
  geom_line(size = 2, color = "black") +
  labs(x = "Datum", y = "Anteil der Covid-Infektionen", title = "Anteil der münchner Covid-Infektionen an Bayern um die BLM-Demo") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 27))

# belegte Intensivbetten Prozent
ggplot(data = divi_BLM, aes(x = date, y = invasiv_anteil)) +
  geom_line(stat="identity", size = 2) + 
  labs(x = "Datum", y = "Anteil der invasiv-beatmeten\nCovid-Patienten", title = "Anteil der invasiv-beatmeten Covid-Patienten Münchens an Bayern um die BLM-Demo") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-20")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 27)) +
  ylim(0, NA)

# datensätze vernichten
divi_BLM <- NULL
divi_muenchen <- NULL
data_BLM_germany <- NULL
data_BLM_bayern <- NULL
data_BLM_muenchen <- NULL
data_BLM_bayern_ohne_muenchen <- NULL

