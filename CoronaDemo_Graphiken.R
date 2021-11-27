### Corona Demonstration Graphiken

library(ggplot2)
library(lubridate)



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
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none") +
  annotate("rect", fill = "tomato1", alpha = 0.4, 
           xmin = as.Date(c("2020-09-12")), xmax = as.Date(c("2020-09-26")),
           ymin = 0, ymax = Inf)
  
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
  geom_bar(stat="identity") + theme(legend.position = "none") +
  annotate("rect", fill = "tomato1", alpha = 0.4, 
           xmin = as.Date(c("2020-09-12")), xmax = as.Date(c("2020-09-26")),
           ymin = 0, ymax = Inf)

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






### Barplot Covid Faelle ganz von August bis September

# Muenchen

ggplot(data = data_CorDemo_muenchen, aes(x = date, y = faelle_covid_aktuell, 
                                         fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Corona Fälle in Muenchen von August bis November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none") 
  
# Deutschland

ggplot(data = data_CorDemo_germany, aes(x = date, y = faelle_covid_aktuell, 
                                        fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Corona Fälle in Deutschland von August bis November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none") 


# Bayern

ggplot(data = data_CorDemo_bayern, aes(x = date, y = faelle_covid_aktuell, 
                                       fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Corona Fälle in Bayern von August bis November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none")


# Bayern ohne Muenchen

ggplot(data = data_CorDemo_bayern_ohne_muenchen, aes(x = date, y = faelle_covid_aktuell, 
                                                     fill = ifelse(date == "2020-09-12", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey50","red")) +
  ggtitle("Corona Fälle in Bayern ohne München von August bis November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none")




### Gemeinsamer Bar-Plot: Corona Fälle und Invasiv Beatmet in Muenchen 

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_CorDemo_muenchen, aes(x=date)) +
geom_bar(aes(y=faelle_covid_aktuell, col = "faelle_covid_aktuell"), stat = "identity", position = "identity") +
geom_bar(aes(y=faelle_covid_aktuell_invasiv_beatmet, col = "faelle_covid_aktuell_invasiv_beatmet"), stat = "identity", position = "identity") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") +
  ggtitle(" Verlauf von Corona Fällen und Invasiv Beatmeten Fällen in München") 
  

scale_color_manual("Index", values = color_code)



#### Ganz September Muenchen: Vergleich zwischen aktuele covid-faelle und Intensiv beatmete Faelle

color_code <- c("faelle_covid_aktuell" = "blue",
                "faelle_covid_aktuell_invasiv_beatmet" = "red")

ggplot(data = data_muc_sep)+ aes(x = date) + geom_line(aes( y = faelle_covid_aktuell, col = "faelle_covid_aktuell")) +
  geom_line(aes(y = faelle_covid_aktuell_invasiv_beatmet, col = "faelle_covid_aktuell_invasiv_beatmet" ))

scale_color_manual("Index", values = color_code)





### Vergleich mit Berlin

data_berlin <- subset(divi_17_11, bundesland == "11")
data_CorDemo_berlin <- subset(data_berlin, date >= "2020-08-01" &  date <= "2020-09-30")

## Alle Corona Fälle in Berlin 
ggplot(data = data_berlin, aes(x = date, y = faelle_covid_aktuell)) +
  ggtitle("Corona Fälle in Berlin") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity")

## Corona-Fall Berlin von August bis November
ggplot(data = data_CorDemo_berlin, aes(x = date, y = faelle_covid_aktuell, 
                                         fill = ifelse(date == "2020-08-29", "Corona-Demo", " Tage"))) +
  scale_fill_manual(name = "area", values=c("grey27","red")) +
  ggtitle("Corona Fälle in Berlin von August bis November") +
  xlab("Datum") + ylab("Aktuelle Covid Fälle") + geom_bar(stat="identity") + theme(legend.position = "none") + 
  annotate("rect", fill = "tomato1", alpha = 0.4, 
           xmin = as.Date(c("2020-08-29")), xmax = as.Date(c("2020-09-12")),
           ymin = 0, ymax = Inf)
