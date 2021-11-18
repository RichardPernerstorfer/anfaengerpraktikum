#### Corona Demonstration in Muenchen am 12.09.2020

library(ggplot2)

ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  geom_bar(stat="identity")


#### Ganz September Muenchen: Vergleich zwischen aktuele covid-faelle und Intensiv beatmete Faelle

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_muc_sep)+ aes(x = date)+ geom_line(aes( y = faelle_covid_aktuell, col = "faelle_covid_aktuell")) +
  geom_line(aes(y=faelle_covid_aktuell_invasiv_beatmet, col= "faelle_covid_aktuell_invasiv_beatmet" ))

scale_color_manual("Index", values = color_code)


### Mittelwert Covid Faelle in Muenchen

mean_muc_aug_covfaelle <- mean(data_muc_aug$faelle_covid_aktuell)
mean_muc_aug_covfaelle

mean_muc_sep_covfaelle <- mean(data_muc_sep$faelle_covid_aktuell)
mean_muc_sep_covfaelle

mean_muc_oct_covfaelle <- mean(data_muc_oct$faelle_covid_aktuell)
mean_muc_oct_covfaelle

mean_muc_nov_covfaelle <- mean(data_muc_nov$faelle_covid_aktuell)
mean_muc_nov_covfaelle


### Mittelwert Intensiv beatmet in Muenchen

mean_muc_aug_invbeatmet <- mean(data_muc_aug$faelle_covid_aktuell_invasiv_beatmet)
mean_muc_aug_invbeatmet


mean_muc_sep_invbeatmet <- mean(data_muc_sep$faelle_covid_aktuell_invasiv_beatmet)
mean_muc_sep_invbeatmet


mean_muc_oct_invbeatmet <- mean(data_muc_oct$faelle_covid_aktuell_invasiv_beatmet)
mean_muc_oct_invbeatmet


mean_muc_nov_invbeatmet <- mean(data_muc_nov$faelle_covid_aktuell_invasiv_beatmet)
mean_muc_nov_invbeatmet


### Korrelation zwischen Covid Fälle und Intensiv Beatmet in Muenchen September
cor(data_muc_sep$faelle_covid_aktuell , data_muc_sep$faelle_covid_aktuell_invasiv_beatmet)
cor.test(data_muc_sep$faelle_covid_aktuell , data_muc_sep$faelle_covid_aktuell_invasiv_beatmet)

##Positiven Zsmhang berechnen (einseitigen Test)
cor.test(data_muc_sep$faelle_covid_aktuell , data_muc_sep$faelle_covid_aktuell_invasiv_beatmet, alternative = "greater")

### A:  starker Zusammenhang !!!













