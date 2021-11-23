library(ggplot2)


## Muenchen Juni - August

plot_muc_jun_aug <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anzahl Infektionen") + geom_bar(stat="identity")

plot_rel_jun_aug <- ggplot(data = data_BLM_muenchen, aes(x = date, y = faelle_covid_anteil)) +
  ggtitle("Infektionsgeschehen zwischen Juni und August in München") +
  xlab("Datum") + ylab("Anteil Infektionen") + geom_line()
