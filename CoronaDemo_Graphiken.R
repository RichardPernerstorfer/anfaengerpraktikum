### Corona Demonstration Graphiken

library(ggplot2)
library(ggpubr)
library(patchwork)

### Barplot Covid Faelle ganz von August bis September

# Muenchen

plot_Cordemo_muenchen <- ggplot(data = data_CorDemo_muenchen, aes(x = date, y = faelle_covid_aktuell))  +
  ggtitle("Covid Fälle in München um Corona Demonstration ") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") +  geom_bar(stat="identity")  +
  scale_x_date( date_breaks = "1 week") +
  theme(axis.text.x=element_text(angle = 45, hjust=1)) +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 1) + 
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 1) +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 30)) 


plot_Cordemo_muenchen


# Bayern

plot_Cordemo_bayern <- ggplot(data = data_CorDemo_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Covid Fälle in Bayern um Corona Demonstration") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + 
  geom_bar(stat="identity") + 
  scale_x_date( date_breaks = "1 week") +
  theme(axis.text.x=element_text(angle = 45, hjust = 1))+
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 1) +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 30)) 

plot_Cordemo_bayern



# --> insgesamt 
ggplot_muc_bayern_cordemo <- ggarrange(plot_Cordemo_muenchen, plot_Cordemo_bayern,
          ncol = 1, nrow = 2) +
  plot_annotation(theme = theme(plot.title = element_text(size = 30), plot.subtitle = element_text(size = 20)),
                  
                  title = "Event 2: Corona Demonstration", 
                  subtitle = "Anzahl bestätigter Covid-Fälle in München und Bayern um Corona Demonstration 2020")

ggplot_muc_bayern_cordemo



### Anteil München an Bayern

# Erstmal Datensatz umändern:
data_CorDemo_bayern_covfaelle_aggregate <- aggregate(data_CorDemo_bayern$faelle_covid_aktuell, data_CorDemo_bayern[1], sum)
data_CorDemo_muenchen_anteil_covfaelle_aktuell <- data_CorDemo_muenchen$faelle_covid_aktuell / data_CorDemo_bayern_covfaelle_aggregate$x
data_CorDemo_bayern_covfaelle_aggregate$x <- data_CorDemo_muenchen_anteil_covfaelle_aktuell

data_CorDemo_bayern_covfaelle_aggregate
data_CorDemo_muenchen_anteil_covfaelle_aktuell

#Plot
ggplot(data = data_CorDemo_bayern_covfaelle_aggregate, aes(x = date, y = x)) +
  geom_line(stat = "identity", size = 2) +
  labs(x = "Datum" , y = "Anteil aktueller Covid-Fälle", title = " Event 2: Corona Demonstration",
       subtitle = "Anteil Covid-Fälle Münchens an Covid-Fälle Bayerns um Corona Demonstration 2020") +
  scale_x_date(date_breaks = "1 week") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 1) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "blue", size = 1) +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 30)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1))+
  expand_limits(y = 0)



# Belegte Intensivbetten in Bayern (absolut)
plot_betten_muenchen_Cordemo <- ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_CorDemo_muenchen, stat = "identity", fill = "blue") + 
  geom_bar(aes(y = betten_belegt, x = date), data = data_CorDemo_muenchen, stat = "identity") + 
    labs(x = "Datum", y = "Intensivbetten absolut ", title = "Event 2: Corona Demonstration", 
    subtitle = "Anzahl aller vohandenden Intensivbetten und Anzahl belegter Intensivbetten in München 
       um Corona Demonstration 2020") +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "violet", size = 2) +
  scale_x_date(date_breaks = "1 week") +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 30)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1))

plot_betten_muenchen_Cordemo



# Belegte Intensivbetten von München in Prozent
ggplot(data = data_CorDemo_muenchen, aes(x = date, y = betten_anteil)) +
  geom_line(stat="identity", size = 2) + 
  labs(x = "Datum", y = "Anteil belegter Intensivbetten ", title = "Event 2: Corona Demonstration ",
       subtitle = "Anteil belegter Intensivbetten Münchens an belegter Intensivbetten Bayerns um Corona Demonstration 2020") +
  scale_x_date(date_breaks = "1 week" ) +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 30)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1)) +
  geom_vline(xintercept= as.Date(c("2020-09-12")), color = "red", size = 2) +
  geom_vline(xintercept= as.Date(c("2020-09-19")), color = "violet", size = 2) +
  expand_limits(y = 0)




  













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
