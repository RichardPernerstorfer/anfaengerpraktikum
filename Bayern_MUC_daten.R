library(readr)
divi_03_11<- read_csv("DIVI-Intensivregister-2021-11-03-12-15.csv.csv")



data_bayern <- subset(divi_03_11, bundesland == "09")

## Bayern September
data_bayern_sep <- subset(data_bayern, date >= "2020-09-01" & date <= "2020-09-30" )
data_bayern$date <-as.Date(data_bayern$date, format = "%Y-%m-%d")

## MUC in September
data_bayern_sep_muc <- subset(data_bayern_sep, gemeindeschluessel == "09162")

ggplot(data = data_bayern_sep_muc, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

ggplot(data = data_bayern_sep, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

ggplot(data = data_bayern_sep_muc, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  geom_bar(stat="identity")


## Bayern und MUC in Oktober
data_bayern_oct <- subset(data_bayern, date >= "2020-10-01" & date <= "2020-10-31" )
data_bayern_oct_muc <- subset(data_bayern_oct, gemeindeschluessel == "09162")

## Bayern Fälle

ggplot(data = data_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity")

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_bayern)+ aes(x = date)+ geom_line(aes( y = faelle_covid_aktuell, col = "faelle_covid_aktuell")) +
  geom_line(aes(y=faelle_covid_aktuell_invasiv_beatmet, col= "faelle_covid_aktuell_invasiv_beatmet" ))

scale_color_manual("Index", values = color_code)
