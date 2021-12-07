library(ggplot2)
library(patchwork)


### Absolute Covid-Fälle Bayern

plot_BLM_bayern <- ggplot(data = data_BLM_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  labs(x = "Datum", y = "Aktuelle Covid-Fälle",title = "Aktuelle Covid-Fälle in Bayern") +
  geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))
plot_BLM_bayern


### Absolute Covid-Fälle München

plot_BLM_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  labs(x = "Datum", y = "Aktuelle Covid-Fälle",
       title = "Aktuelle Covid-Fälle in München") + geom_bar(stat="identity") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))
plot_BLM_muenchen


### Absolute Covid-Fälle München + Bayern

plot_muenchen_bayern <- plot_BLM_muenchen / plot_BLM_bayern

plot_muenchen_bayern <- plot_muenchen_bayern + 
                        plot_annotation(theme = theme(plot.title = element_text(size = 30), plot.subtitle = element_text(size = 20)),
                                        
                                        title = "Event 1: Black Lives Matter Demonstration", 
                        subtitle = "Anzahl bestätigter Covid-Fälle in München und Bayern um die Black Lives Matter Demonstration 2020")
                        

plot_muenchen_bayern


### Anteil Covid-Fälle München an Bayern 

plot_anteil_muenchen_bayern <- ggplot( data = data_BLM_muenchen, aes(x = date, y = anteil)) +
  geom_line(size = 2) + 
  labs(x = "Datum", y = "Anteil Covid-Fälle",
       title = "Event 1: Black Lives Matter Demonstration",
       subtitle = "Anteil Covid-Fälle Münchens an Covid-Fälle Bayerns um die Black Lives Matter Demonstration 2020") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  expand_limits(y = 0) +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))
plot_anteil_muenchen_bayern


### Anteil Betten München an Bayern

plot_anteil_betten_muc_bay <- ggplot( data = data_BLM_muenchen, aes(x = date, y = anteil_betten)) +
  geom_line(size = 2) +
  labs(x = "Datum", y = "Anteil belegter Intensivbetten ",
  title = "Event 1: Black Lives Matter Demonstration", 
  subtitle = "Anteil belegter Intensivbetten Münchens an belegter Intensivbetten Bayerns 
  um die Black Lives Matter Demonstration 2020") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-20")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  expand_limits(y = 0) +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))
plot_anteil_betten_muc_bay


### Belegte Betten München

plot_betten_muenchen <- ggplot(data = data_BLM_muenchen) + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_BLM_muenchen, stat = "identity", fill = "blue") + 
  geom_bar(aes(x = date, y = betten_belegt), stat = "identity") +
  labs(x = "Datum", y = "Intensivbetten absolut",title = "Event 1: Black Lives Matter Demonstration",
       subtitle = "Anzahl aller vohandenden Intensivbetten und Anzahl belegter Intensivbetten in München 
       um die Black Lives Matter Demonstration 2020") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-20")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))
plot_betten_muenchen








### Old!

### Anteilige Infektionzahlen an Einwohnerzahl Muenchen

plot_rel_BLM_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_anteil)) +
  ggtitle("Anteil Covid-Fälle zwischen Mai und August in München 2020") +
  xlab("Datum") + ylab("Anteil aktueller Covid-Fälle") + geom_line() +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1)
plot_rel_BLM_muenchen


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

### Bettenbelegung Bayern Anhang!

plot_betten_bayern <- ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_BLM_bayern, stat = "identity", fill = "blue") + 
  geom_bar(aes(y = betten_belegt, x = date), data = data_BLM_bayern, stat = "identity") + 
  labs(x = "Datum", y = "Intensivbetten absolut ", title = "Intensivbetten in Bayern") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red") +
  geom_vline(xintercept= as.Date(c("2020-06-20")), color = "violet") +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d") +
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30))

plot_betten_bayern
