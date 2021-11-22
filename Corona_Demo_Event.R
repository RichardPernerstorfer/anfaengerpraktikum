#### Corona Demonstration in Muenchen am 12.09.2020


### Mittelwert Covid Faelle in Muenchen

mean_muc_aug_covfaelle <- mean(data_muc_aug$faelle_covid_aktuell)  ## 9.1
mean_muc_aug_covfaelle

mean_muc_sep_covfaelle <- mean(data_muc_sep$faelle_covid_aktuell)  ## 12.1
mean_muc_sep_covfaelle

mean_muc_oct_covfaelle <- mean(data_muc_oct$faelle_covid_aktuell)  ## 15.4
mean_muc_oct_covfaelle

mean_muc_nov_covfaelle <- mean(data_muc_nov$faelle_covid_aktuell)  ## 81
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

## Einseitigen Test
cor.test(data_muc_sep$faelle_covid_aktuell , data_muc_sep$faelle_covid_aktuell_invasiv_beatmet)

##Positiven Zsmhang berechnen (einseitigen Test)
cor.test(data_muc_sep$faelle_covid_aktuell , data_muc_sep$faelle_covid_aktuell_invasiv_beatmet, alternative = "greater")

### A:  starker Zusammenhang !!!




### Korrelation zwischen Covid Fälle und Intensiv Beatmet in Muenchen October













