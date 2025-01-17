library(ggplot2)

ggplot() + 
  geom_line(aes(x = date, y = A0_bis_A4, group = 1, color = "Altergruppe 0 bis 4"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A5_bis_A15, group = 1, color = "Altergruppe 5 bis 15"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A15_bis_A34, group = 1, color = "Altergruppe 15 bis 34" ), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A35_bis_A59, group = 1, color = "Altergruppe 35 bis 59"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A60_bis_A79, group = 1, color = "Altergruppe 60 bis 79"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A80_plus, group = 1, color = "Altergruppe 80 +"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  theme(axis.text.x = element_text(size = 18, face = "bold", angle = 45, vjust = 1, hjust = 1)) + 
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  labs(x = "Datum in Kalenderwochen", y = "Hospitalisierungen", title = "Hospitalisierungen nach Altersgruppe in Deutschland", color = "Altersgruppen") +
  theme(text = element_text(size = 30)) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

ggplot() + 
  geom_line(aes(x = date, y = A0_bis_A4 / 39.69138, group = 1, color = "Altergruppe 0 bis 4"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A5_bis_A15 / 82.5288, group = 1, color = "Altergruppe 5 bis 15"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A15_bis_A34 / 189.2129, group = 1, color = "Altergruppe 15 bis 34" ), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A35_bis_A59 / 286.6617, group = 1, color = "Altergruppe 35 bis 59"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A60_bis_A79 / 181.5334, group = 1, color = "Altergruppe 60 bis 79"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A80_plus / 59.36434, group = 1, color = "Altergruppe 80 +"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  theme(axis.text.x = element_text(size = 18, face = "bold", angle = 45, vjust = 1, hjust = 1)) + 
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  labs(x = "Datum in Kalenderwochen", y = "Hospitalisierungsinzidenz", title = "Hospitalisierungs-Inzidenz pro Altersgruppe in Deutschland", color = "Altersgruppen") +
  theme(text = element_text(size = 30)) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

Hosp_data_bayern <- `data_lgl1 (1)`
Hosp_data_bayern <- aggregate(Hosp_data_bayern[4], by = Hosp_data_bayern[1], FUN = sum)

ggplot(data = Hosp_data_bayern, mapping = aes(x = Meldedatum, y = Hospitalisierung/  130.7672)) +
  geom_col(width = 1) +
  theme(axis.text.x = element_text(size = 18, face = "bold", angle = 45, vjust = 1, hjust = 1)) + 
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  labs(x = "Datum", y = "Hospitalisierungen pro 100.000 Einwohner", title = "Hospitalisierungsinzidenz in Bayern") +
  theme(text = element_text(size = 30)) +
  scale_x_date(breaks = "1 month", date_labels = "%b %d")

### Altersgruppen
ggplot() + 
  geom_line(aes(x = datum, y = A0_bis_A4, group = 1, color = "Altergruppe 0 bis 4"), data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = datum, y = A5_bis_A15, group = 1, color = "Altergruppe 5 bis 15"), data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = datum, y = A15_bis_A34, group = 1, color = "Altergruppe 15 bis 34"), data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = datum, y = A35_bis_A59, group = 1, color = "Altergruppe 35 bis 59"), data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = datum, y = A60_bis_A79, group = 1, color = "Altergruppe 60 bis 79"), data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = datum, y = A80_plus, group = 1, color = "Altergruppe 80 +"), data = Fälle_Hospitalisierung_Alter) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
  labs(x = "Datum in Kalenderwochen", y = "Covid-Fälle", title = "Covid-Fälle pro Altersgruppe in Deutschland", color = "Altersgruppen") +
  theme(text = element_text(size = 15)) 


##  Allgemein Bayern Fälle mit Events eingezeichnet

ggplot(data = data_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Covid Fälle in Bayern") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  geom_bar(stat="identity", width = 1) + 
  scale_x_date( date_breaks = "1 month", date_labels = "%b %d") +
  theme(axis.text.x=element_text(angle=50, hjust=1))+
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red2", size = 1) +
  geom_text(aes(x=as.Date(c("2020-09-12")), label="Corona-Demonstration", y = 750), colour="blue", angle=90, vjust = 1.2, text = element_text(size=25))+
  
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1) +
  geom_text(aes(x=as.Date(c("2020-06-06")), label="BLM-Demonstration", y = 750), colour="blue", angle=90, vjust = 1.2, text = element_text(size=25))+
  annotate("rect", fill = "red", alpha = 0.4, 
           xmin = as.Date(c("2021-06-11")) - 0.5, xmax = as.Date(c("2021-07-11")) + 0.5,
           ymin = 0, ymax = Inf) +
  geom_vline(xintercept= as.Date(c("2021-06-15")), color = "red", size = 1)+
  geom_vline(xintercept= as.Date(c("2021-06-19")), color = "red", size = 1)+
  geom_vline(xintercept= as.Date(c("2021-06-23")), color = "red", size = 1)+
  geom_vline(xintercept= as.Date(c("2021-07-02")), color = "red", size = 1)+
  geom_text(aes(x=as.Date(c("2021-07-12")), label="Fußball-EM", y = 750), colour="blue", angle=90, vjust = 1.2, text = element_text(size=25))+
  
  annotate("rect", fill = "red", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")) - 0.5, xmax = as.Date(c("2021-09-12")) + 0.5,
           ymin = 0, ymax = Inf)  +
  geom_text(aes(x=as.Date(c("2021-09-12")), label="IAA", y = 750, size = 20), colour="blue", angle=90, vjust = 1.2)+
  
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1)) 
 
