### Corona Demonstration Graphiken

library(ggplot2)
library(lubridate)


### Barplot Covid Faelle ganz von August bis September

# Muenchen

plot_Cordemo_muenchen <- ggplot(data = data_CorDemo_muenchen, aes(x = date, y = faelle_covid_aktuell, 
                                         fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey25","red")) +
  ggtitle("Corona Fälle in München ") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  geom_bar(stat="identity") + 
  theme(legend.position = "none") +
  scale_x_date( date_labels = "%b %d", date_breaks = "2 week") +
  theme(axis.text.x=element_text(angle=50, hjust=1))
  
plot_Cordemo_muenchen

# Deutschland

plot_Cordemo_de <- ggplot(data = data_CorDemo_germany, aes(x = date, y = faelle_covid_aktuell, 
                                        fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey25","red")) +
  ggtitle("Corona Fälle in Deutschland") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  geom_bar(stat="identity") + 
  theme(legend.position = "none") +
  scale_x_date( date_labels = "%b %d", date_breaks = "2 week") +
  theme(axis.text.x=element_text(angle=50, hjust=1))+
  
plot_Cordemo_de

# Bayern

plot_Cordemo_bayern <- ggplot(data = data_CorDemo_bayern, aes(x = date, y = faelle_covid_aktuell, 
                                       fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey25","red")) +
  ggtitle("Corona Fälle in Bayern") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  geom_bar(stat="identity") + 
  theme(legend.position = "none")+
  scale_x_date( date_labels = "%b %d", date_breaks = "2 week") +
  theme(axis.text.x=element_text(angle=50, hjust=1))

plot_Cordemo_bayern



# --> insgesamt 

ggarrange(plot_Cordemo_muenchen, plot_Cordemo_bayern,
          ncol = 1, nrow = 2)






#### Ganz September Muenchen: Vergleich zwischen aktuele covid-faelle und Intensiv beatmete Faelle

color_code <- c("Aktuelle Covid Fälle" = "blue",
                "Aktuell an Corona invasiv beatmet" = "red")

ggplot(data = data_CorDemo_muenchen) + aes(x = date) +
  geom_line(aes( y = faelle_covid_aktuell, col = "Aktuelle Covid Fälle")) +
  geom_line(aes(y = faelle_covid_aktuell_invasiv_beatmet, col = "Aktuell an Corona invasiv beatmet" )) + 
  scale_x_date(date_breaks = "1 week" ) +
  theme(axis.text.x=element_text(angle=50, hjust=1)) + 
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  ggtitle(" Verlauf von Corona Fällen und Invasiv Beatmeten Fällen in München") +

  scale_colour_manual(name = "Linien Farben",
                    values = color_code)


# Belegte Intensivbetten corona demo
color_code2 <- c("Aktuelle Covid Fälle" = "blue",
                 "Aktuell an Corona invasiv beatmet" = "red")

ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date, fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage")), data = data_CorDemo_muenchen, stat = "identity", fill = "blue") + 
  geom_bar(aes(y = betten_belegt, x = date, fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage")), data = data_CorDemo_muenchen, stat = "identity") + 
  labs(x = "Datum", y = "Intensivbetten absolut ", title = "Intensivbetten in München von August bis November")   +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  scale_x_date(date_breaks = "2 week" , date_labels = "%b %Y") +
  scale_colour_manual(name = "Bar Farben",
                      values = color_code2)



# belegte Intensivbetten Prozent
ggplot(data = data_CorDemo_muenchen, aes(x = date, y = betten_anteil)) +
  geom_line(stat="identity") + 
  labs(x = "Datum", y = "Anteil belegter Intensivbetten", title = "Anteil belegter Intensivbetten in München um Corona Demonstration ") +
  scale_x_date(date_breaks = "2 week" ) 




### aggregate plot

data_CorDemo_bayern_covfaelle_aggregate <- aggregate(data_CorDemo_bayern$faelle_covid_aktuell, data_CorDemo_bayern[1], sum)
data_CorDemo_muenchen_anteil_covfaelle_aktuell <- data_CorDemo_muenchen$faelle_covid_aktuell / data_CorDemo_bayern_covfaelle_aggregate$x
data_CorDemo_bayern_covfaelle_aggregate$x <- data_CorDemo_muenchen_anteil_covfaelle_aktuell

data_CorDemo_bayern_covfaelle_aggregate
data_CorDemo_muenchen_anteil_covfaelle_aktuell


ggplot(data = data_CorDemo_bayern_covfaelle_aggregate, aes(x=date, y=x)) +
  geom_line(stat = "identity") +
  labs(x = "Datum" , y = "Relative Häufigkeit", title = " Relative Häufigkeit der bayrischen Covid-Fälle von München um Corona-Demonstration") +
  scale_x_date(date_breaks = "2 week" , date_labels = "%b %d") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 1)










### Sonstige 




### Gemeinsamer Bar-Plot: Corona Fälle und Invasiv Beatmet in Muenchen 

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_CorDemo_muenchen, aes(x=date)) +
  geom_bar(aes(y=faelle_covid_aktuell, col = "faelle_covid_aktuell"), stat = "identity") +
  geom_bar(aes(y=faelle_covid_aktuell_invasiv_beatmet, col = "faelle_covid_aktuell_invasiv_beatmet"), stat = "identity") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") +
  ggtitle(" Verlauf von Corona Fällen und Invasiv Beatmeten Fällen in München") 


scale_color_manual("Index", values = color_code)




### Bar-Plots zu Corona Faellen in München von August bis November

# August
plot_muc_aug_cov <- ggplot(data = data_muc_aug, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Corona Fälle in Muenchen in August") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") 

plot_muc_aug_cov

# September
plot_muc_sep_cov <- ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell, 
                                                    fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Corona Fälle in Muenchen in September") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none") 

plot_muc_sep_cov 

# Oktober
plot_muc_oct_cov <- ggplot(data = data_muc_oct, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Corona Fälle in Muenchen in Oktober") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity")

plot_muc_oct_cov

# November
plot_muc_nov_cov <- ggplot(data = data_muc_nov, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Corona Fälle in Muenchen in November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity")

plot_muc_nov_cov




### Barplots zu Invasiv Beatmeten in Muenchen von August bis November

# August
plot_muc_aug_invb <-ggplot(data = data_muc_aug, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  ggtitle("Invasiv Beatmete Covid Fälle in München in August")+
  xlab("Datum") + ylab("Aktuelle Covid invasiv beatmeten Fällen") +
  geom_bar(stat="identity")

plot_muc_aug_invb

# September
plot_muc_sep_invb <-ggplot(data = data_muc_sep, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet,
                                                    fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Invasiv Beatmete Covid Fälle in München in September")+
  xlab("Datum") + ylab("Aktuelle Covid invasiv beatmeten Fällen") +
  geom_bar(stat="identity") + theme(legend.position = "none") 

plot_muc_sep_invb 

# Oktober
plot_muc_oct_invb <-ggplot(data = data_muc_oct, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  ggtitle("Invasiv Beatmete Covid Fälle in München in Oktober")+
  xlab("Datum") + ylab("Aktuelle Covid invasiv beatmeten Fällen") +
  geom_bar(stat="identity")

plot_muc_oct_invb

# November
plot_muc_nov_invb <- ggplot(data = data_muc_nov, aes(x = date, y = faelle_covid_aktuell_invasiv_beatmet)) +
  ggtitle("Invasiv Beatmete Covid Fälle in München in November")+
  xlab("Datum") + ylab("Aktuelle Covid invasiv beatmeten Fällen") +
  geom_bar(stat="identity")

plot_muc_nov_invb




### Alle Bar-Plots zu Corona Faellen in München von August bis November in Einem


library(ggpubr)

ggarrange(plot_muc_aug_cov, plot_muc_sep_cov, plot_muc_oct_cov, plot_muc_nov_cov ,
          ncol = 2, nrow = 2)






