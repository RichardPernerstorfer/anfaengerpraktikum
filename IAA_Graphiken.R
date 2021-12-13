# Datensätze erstellen
data_IAA_germany <- subset(RKI_COVID19, Meldedatum >= "2021-08-07" & Meldedatum <= "2021-11-12" )
data_IAA_bayern <- subset(data_IAA_germany, IdBundesland == "9" )
data_IAA_muenchen <- subset(data_IAA_bayern, Landkreis == "SK München")
data_IAA_bayern_ohne_muenchen  <- subset(data_IAA_bayern, Landkreis != "SK München")
data_IAA_germany <- aggregate(data_IAA_germany$AnzahlFall, data_IAA_germany[9], sum)
data_IAA_bayern <- aggregate(data_IAA_bayern$AnzahlFall, data_IAA_bayern[9], sum)
data_IAA_muenchen <- aggregate(data_IAA_muenchen$AnzahlFall, data_IAA_muenchen[9], sum)
data_IAA_bayern_ohne_muenchen <- aggregate(data_IAA_bayern_ohne_muenchen$AnzahlFall, data_IAA_bayern_ohne_muenchen[9], sum)
data_IAA_muenchen$anteil <- data_IAA_muenchen$x / data_IAA_bayern$x
divi_IAA <- subset(divi_17_11,date >= "2021-08-07" & date <= "2021-11-12" & bundesland == "09" )
divi_muenchen <- subset(divi_IAA, gemeindeschluessel == "09162")
divi_muenchen <- aggregate(divi_muenchen$faelle_covid_aktuell_invasiv_beatmet, divi_muenchen[1], sum)
divi_IAA <- aggregate(divi_IAA$faelle_covid_aktuell_invasiv_beatmet, divi_IAA[1], sum)
divi_IAA$invasiv_anteil <- divi_muenchen$x / divi_IAA$x



# Fälle IAA München
IAA_muenchen_plot <- ggplot(data = data_IAA_muenchen, aes(x = Meldedatum, y = x / 14.72)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 EInwohner um die IAA in München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")) - 0.5 , xmax = as.Date(c("2021-09-12")) + 0.5,
           ymin = 0, ymax = Inf)  +
  annotate("rect", fill = "skyblue1", alpha = 0.4, 
           xmin = as.Date(c("2021-09-14")) -0.5, xmax = as.Date(c("2021-09-26")) +0.5,
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
 theme(text = element_text(size = 23))


# Fälle IAA Bayern ohne München 
IAA_bayern_ohne_muenchen_plot <- ggplot(data = data_IAA_bayern_ohne_muenchen, aes(x = Meldedatum, y = x / 130.8)) +
  geom_bar(stat="identity", width = 1) + 
  labs(x = "Datum", y = "Covid-Infektionen\npro 100.000 Einwohner", title = "Tägliche Covid-Infektionen pro 100.000 Einwohner um die IAA in Rest-Bayern") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")) - 0.5 , xmax = as.Date(c("2021-09-12")) + 0.5,
           ymin = 0, ymax = Inf)  +
  annotate("rect", fill = "skyblue1", alpha = 0.4, 
           xmin = as.Date(c("2021-09-14")) -0.5, xmax = as.Date(c("2021-09-26")) +0.5,
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 16, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 16, face = "bold")) +
  theme(text = element_text(size = 23))


#Zusammenhängende Grafik
ggarrange(IAA_muenchen_plot, IAA_bayern_ohne_muenchen_plot, nrow = 2)

# Fälle IAA Anteil München an Bayern
ggplot(data = data_IAA_muenchen, aes(y = anteil, x = Meldedatum)) + 
  geom_line(size = 2, color = "black") +
  labs(x = "Datum", y = "Anteil der Covid-Infektionen", title = "Anteil der münchner Covid-Infektionen an Bayern um die IAA") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")) - 0.5 , xmax = as.Date(c("2021-09-12")) + 0.5,
           ymin = 0, ymax = Inf)  +
  annotate("rect", fill = "skyblue1", alpha = 0.4, 
           xmin = as.Date(c("2021-09-14")) -0.5, xmax = as.Date(c("2021-09-26")) +0.5,
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 27))

# belegte Intensivbetten Prozent
ggplot(data = divi_IAA, aes(x = date, y = invasiv_anteil)) +
  geom_line(stat="identity", size = 2) + 
  labs(x = "Datum", y = "Anteil der invasiv-beatmeten\nCovid-Patienten", title = "Anteil der invasiv-beatmeten Covid-Patienten Münchens an Bayern um die IAA") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")) - 0.5, xmax = as.Date(c("2021-09-12")) + 0.5,
           ymin = 0, ymax = Inf)  +
annotate("rect", fill = "plum4", alpha = 0.4, 
           xmin = as.Date(c("2021-09-21")) - 0.5, xmax = as.Date(c("2021-10-03")) + 0.5,
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week", date_labels = "%d. %b %y") +  
theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 27))

# datensätze vernichten
divi_IAA <- NULL
divi_muenchen <- NULL
data_IAA_germany <- NULL
data_IAA_bayern <- NULL
data_IAA_muenchen <- NULL
data_IAA_bayern_ohne_muenchen <- NULL
