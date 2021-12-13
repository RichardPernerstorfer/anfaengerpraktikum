# Datensätze erstellen
data_IAA_germany <- subset(RKI_COVID19, Meldedatum >= "2020-05-06" & Meldedatum <= "2020-08-06" )
data_IAA_bayern <- subset(data_IAA_germany, IdBundesland == "9" )
data_IAA_muenchen <- subset(data_IAA_bayern, Landkreis == "SK München")
data_IAA_bayern_ohne_muenchen  <- subset(data_IAA_bayern, Landkreis != "SK München")
data_IAA_germany <- aggregate(data_IAA_germany$AnzahlFall, data_IAA_germany[9], sum)
data_IAA_bayern <- aggregate(data_IAA_bayern$AnzahlFall, data_IAA_bayern[9], sum)
data_IAA_muenchen <- aggregate(data_IAA_muenchen$AnzahlFall, data_IAA_muenchen[9], sum)
data_IAA_muenchen <- rbind(data_IAA_muenchen, c("2020-06-01", 0))
data_IAA_muenchen <- data_IAA_muenchen[order(data_IAA_muenchen[,1]),]
data_IAA_bayern_ohne_muenchen <- aggregate(data_IAA_bayern_ohne_muenchen$AnzahlFall, data_IAA_bayern_ohne_muenchen[9], sum)
data_IAA_muenchen$x <- as.numeric(data_IAA_muenchen$x)
data_IAA_muenchen$anteil <- data_IAA_muenchen$x / data_IAA_bayern$x
divi_IAA <- subset(divi_17_11,date >= "2020-05-06" & date <= "2020-08-06" & bundesland == "09" )
divi_muenchen <- subset(divi_IAA, gemeindeschluessel == "09162")
divi_muenchen <- aggregate(divi_muenchen$faelle_covid_aktuell_invasiv_beatmet, divi_muenchen[1], sum)
divi_IAA <- aggregate(divi_IAA$faelle_covid_aktuell_invasiv_beatmet, divi_IAA[1], sum)
divi_IAA$invasiv_anteil <- divi_muenchen$x / divi_IAA$x

# Fälle IAA Bayern
IAA_bayern_plot <- ggplot(data = data_IAA_bayern, aes(x = Meldedatum, y = x)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid Neu-Infektionen", title = "Covid-Infektionen um die BLM-Demo bayernweit") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))


# Fälle IAA München
IAA_muenchen_plot <- ggplot(data = data_IAA_muenchen, aes(x = Meldedatum, y = x / 14.72)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die BLM-Demo in München") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))


# Fälle IAA Bayern ohne München 
IAA_bayern_ohne_muenchen_plot <- ggplot(data = data_IAA_bayern_ohne_muenchen, aes(x = Meldedatum, y = x / 130.8)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die BLM-Demo in Rest-Bayern") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))

#Zusammenhängende Grafik
ggarrange(IAA_muenchen_plot, IAA_bayern_ohne_muenchen_plot, nrow = 2)

# Fälle IAA Anteil München an Bayern
ggplot(data = data_IAA_muenchen, aes(y = anteil, x = Meldedatum)) + 
  geom_line(size = 2, color = "black") +
  labs(x = "Datum", y = "Anteil der Covid-Infektionen", title = "Anteil der münchner Covid-Infektionen an Bayern um die BLM_Demo") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 23))

# belegte Intensivbetten Prozent
ggplot(data = divi_IAA, aes(x = date, y = invasiv_anteil)) +
  geom_line(stat="identity", size = 2) + 
  labs(x = "Datum", y = "Anteil der invasiv-beatmeten\nCovid-Patienten", title = "Anteil der invasiv-beatmeten Covid-Patienten Münchens an Bayern um die BLM-Demo") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-20")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +
  ylim(0, NA)

# datensätze vernichten
divi_IAA <- NULL
divi_muenchen <- NULL
data_IAA_germany <- NULL
data_IAA_bayern <- NULL
data_IAA_muenchen <- NULL
data_IAA_bayern_ohne_muenchen <- NULL

