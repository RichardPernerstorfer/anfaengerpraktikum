library(ggplot2)
library(patchwork)


### Absolute Covid-Fälle Bayern

plot_BLM_bayern <- ggplot(data = data_BLM_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Bayern") +
  xlab("Datum") + ylab("Aktuelle Covid-Fälle") + geom_bar(stat="identity") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 1) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d")
plot_BLM_bayern


### Absolute Covid-Fälle München

plot_BLM_muenchen <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("München") +
  xlab("Datum") + ylab("Aktuelle Covid-Fälle") + geom_bar(stat="identity") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 1) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d")
plot_BLM_muenchen


### Absolute Covid-Fälle München + Bayern

plot_muenchen_bayern <- plot_BLM_muenchen / plot_BLM_bayern

plot_muenchen_bayern + plot_annotation(
  title = "Event 1: Black Lives Matter Demonstration
  Aktuelle Covid-Fälle zwischen Mai und August 2020", 
  subtitle = "Bestätigte Covid-19 Fälle in München und Bayern um die Black Lives Matter Demonstration"
)

plot_muenchen_bayern


### Anteil Covid-Fälle München an Bayern

plot_anteil_muenchen_bayern <- ggplot( data = data_BLM_muenchen, aes(x = date, y = anteil)) +
  geom_line() + 
  plot_annotation(title = "Event 1: Black Lives Matter Demonstration",
                  subtitle = "Anteil Covid-Fälle Münchens an Covid-Fälle Bayerns zwischen Mai und August 2020" ) + xlab("Datum") + ylab("Anteil Covid-Fälle") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "blue", size = 1) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d") +
  expand_limits(y = 0)
plot_anteil_muenchen_bayern


### Anteil Betten Muc an Bayern

plot_anteil_betten_muc_bay <- ggplot( data = data_BLM_muenchen, aes(x = date, y = anteil_betten)) +
  geom_line() +
  ggtitle("Anteil der belegten Betten Münchens in gesamt Bayern") + xlab("Datum") + ylab("Anteil belegter Betten") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "violet", size = 1) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d") +
  expand_limits(y = 0)
plot_anteil_betten_muc_bay


### Bettenbelegung Bayern

plot_betten_bayern <- ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_BLM_bayern, stat = "identity", fill = "blue") + 
  geom_bar(aes(y = betten_belegt, x = date), data = data_BLM_bayern, stat = "identity") + 
  labs(x = "Datum", y = "Intensivbetten absolut ", title = "Intensivbetten in Bayern") +
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d")

plot_betten_bayern


### Belegte Betten München

plot_betten_muenchen <- ggplot(data = data_BLM_muenchen) + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_BLM_muenchen, stat = "identity", fill = "blue") + 
  geom_bar(aes(x = date, y = betten_belegt), stat = "identity") +
  ggtitle("Belegte Betten zwischen Mai und August 2020 in München ") +
  xlab("Datum") + ylab("Belegte Betten") + 
  geom_vline(xintercept= as.Date(c("2020-06-06")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-06-13")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "2 week", date_labels = "%b %d")
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














