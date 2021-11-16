library(readr)
divi_03_11<- read_csv("DIVI-Intensivregister-2021-11-03-12-15.csv")


### Datensatz Bayern

data_bayern <- subset(divi_03_11, bundesland == "09")


### Datensatz München

data_muenchen <- subset(data_bayern, gemeindeschluessel == "09162")







## Datensatz Bayern für September

data_bayern_sep <- subset(data_bayern, date >= "2020-09-01" & date <= "2020-09-30" )
data_bayern$date <-as.Date(data_bayern$date, format = "%Y-%m-%d")



## Muenchen in September

data_muc_sep <- subset(data_bayern_sep, gemeindeschluessel == "09162")



### Verschiede GGplots zu Munchen in September

library(ggplot2)

ggplot(data = data_muc_sep_, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  geom_bar(stat="identity")





## Bayern und München in Oktober

data_bayern_oct <- subset(data_bayern, date >= "2020-10-01" & date <= "2020-10-31" )
data_muc_oct <- subset(data_bayern_oct, gemeindeschluessel == "09162")




## GGplot:  Bayern insgesamt Corona Fälle und Intensiv Beatmet

ggplot(data = data_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_bayern)+ aes(x = date)+ geom_line(aes( y = faelle_covid_aktuell, col = "faelle_covid_aktuell")) +
  geom_line(aes(y=faelle_covid_aktuell_invasiv_beatmet, col= "faelle_covid_aktuell_invasiv_beatmet" ))

scale_color_manual("Index", values = color_code)
