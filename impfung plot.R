library(ggplot2)

###Plot Deutschland Covid-Fälle vs Impfquote

plot_deutschland_covid_faelle<-ggplot(data = divi_17_11)+
  geom_bar(aes(x=date,y=faelle_covid_aktuell),stat="identity")+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(axis.text.x=element_text(angle=50, hjust=1))+
  labs(x = "Datum", y = "Covid-Fälle", title = "Covid-Fälle in Deutschland")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)
plot_deutschland_covid_faelle

#Subset data vor/nach der Impfung
deutschland_vor_impfung<-subset(divi_17_11,date<="2020-12-27")
View(deutschland_vor_impfung)
deutschland_nach_impfung<-subset(divi_17_11,date>="2020-12-27")
View(deutschland_nach_impfung)

deutschland_vor_impfung<-subset(divi_17_11,date<="2020-12-27")
View(deutschland_vor_impfung)

#Plot Covid-Fälle vor der Impfung
plot_deutschland_covid_faelle_vor_impfung<-ggplot(data =deutschland_vor_impfung)+
  geom_bar(aes(x=date,y=faelle_covid_aktuell),stat="identity")+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(text = element_text(size=8),axis.text.x=element_text(angle=50, hjust=1))+
  labs(x = "Datum", y = "Covid-Fälle", title = "Covid-Fälle in Deutschland vor der Impfung")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,2000,4000,6000))
plot_deutschland_covid_faelle_vor_impfung

#Plot Covid-Fälle nach der Impfung
plot_deutschland_covid_faelle_nach_impfung<-ggplot(data =deutschland_nach_impfung)+
geom_bar(aes(x=date,y=faelle_covid_aktuell),stat="identity")+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(text = element_text(size=8),axis.text.x=element_text(angle=50, hjust=1))+
  labs(x = "Datum", y = "Covid-Fälle", title = "Covid-Fälle in Deutschland nach der Impfung")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,2000,4000,6000))
plot_deutschland_covid_faelle_nach_impfung

#Plot Impfquote
color_code<-c("Impfquote erst"="lightgreen",
              "Impfquote voll"="darkgreen")
plot_impfquote<-ggplot()+ 
  geom_line(aes(x =date,y=impf_quote_erst,col="Impfquote erst"), linetype=1,size=1,data = vaccination_timeseries1)+
  geom_line(aes(x =date,y=impf_quote_voll,col="Impfquote voll"), linetype=1,size=1,data = vaccination_timeseries1)+
  labs(x = "Datum", y = "Impfquote", title = "Impfquote in Deutschland")+
  scale_colour_manual(name = "Linien Farben",
                      values = color_code)+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(text = element_text(size=8),axis.text.x=element_text(angle=50, hjust=1),legend.position = c( .1, .8))
plot_impfquote

###3 Graphen zusammen
library(ggpubr)
ggarrange(plot_deutschland_covid_faelle_vor_impfung,plot_deutschland_covid_faelle_nach_impfung, plot_impfquote,
          ncol = 1, nrow = 3)
