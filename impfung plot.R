### Impfstoff Data
vaccination_timeseries <-read_tsv("germany_vaccinations_timeseries_v2.tsv")
View(vaccination_timeseries)

## Formatierung Date
myformat2<-"%Y-%m-%d"
vaccination_timeseries$date<-as.Date(vaccination_timeseries$date,myformat2)
View(vaccination_timeseries)


##Plot Impfquote
color_code<-c("Impfquote erst"="lightgreen",
              "Impfquote voll"="darkgreen")
plot_impfquote<-ggplot()+ 
  geom_line(aes(x =date,y=impf_quote_erst,col="Impfquote erst"), linetype=1,size=1,data = vaccination_timeseries)+
  geom_line(aes(x =date,y=impf_quote_voll,col="Impfquote voll"), linetype=1,size=1,data = vaccination_timeseries)+
  labs(x = "Datum", y = "Impfquote", title = "Impfquote in Deutschland vom Dezember 2020 bis Dezember 2021")+
  scale_x_date(date_breaks = "4 week", date_labels = "%d %b %y")+  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold"))+
  theme(axis.text.y = element_text(size = 18, face = "bold"))+
  theme(text = element_text(size = 30),legend.position = c( .2, .8))+
  scale_color_manual(name = "Linien Farben", values = color_code)+
  ylim(0,NA)+
  geom_vline(xintercept= as.Date(c("2021-10-01")), size = 2)
plot_impfquote


plot_impfquote_ab_Oktober<-ggplot()+ 
  geom_line(aes(x =date,y=impf_quote_erst,col="Impfquote erst"), linetype=1,size=1,data = subset(vaccination_timeseries,date>= "2021-10-01"),size=2)+
  geom_line(aes(x =date,y=impf_quote_voll,col="Impfquote voll"), linetype=1,size=1,data = subset(vaccination_timeseries,date>= "2021-10-01"),size=2)+
  labs(x = "Datum", y = "Impfquote", title = "Impfquote in Deutschland ab Oktober 2021")+
  scale_x_date(date_breaks = "1 week", date_labels = "%d %b %y")+  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold"))+
  theme(axis.text.y = element_text(size = 18, face = "bold"))+
  theme(text = element_text(size = 30),legend.position = c( .8, .2))+
  scale_color_manual(name = "Linien Farben", values = color_code)+
  ylim(0,NA)
plot_impfquote_ab_Oktober




###Plot Deutschland Covid-Fälle vs Impfquote

plot_deutschland_covid_faelle<-ggplot(data = divi_17_11)+
  geom_bar(aes(x=date,y=faelle_covid_aktuell),stat="identity")+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
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
  scale_x_date(date_labels ="%b %y",date_breaks = "4 week")+
  theme(axis.text.x=element_text(size =16,face = "bold",angle=45, vjust = 1,hjust=1))+
  theme(axis.text.y = element_text(size =20, face = "bold")) +
  theme(text = element_text(size = 20))+
  labs(x = "Datum", y = "Covid-Fälle", title = "Covid-Fälle in Deutschland vor dem Beginn der Impfkampagne vom April 2020 bis Dezember 2020")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,2000,4000,6000))
plot_deutschland_covid_faelle_vor_impfung

#Plot Covid-Fälle nach der Impfung
plot_deutschland_covid_faelle_nach_impfung<-ggplot(data =deutschland_nach_impfung)+
geom_bar(aes(x=date,y=faelle_covid_aktuell),stat="identity")+
  scale_x_date(date_labels ="%b %y",date_breaks = "4 week")+
  theme(axis.text.x = element_text(size =16,face = "bold", angle = 45, vjust = 1, hjust = 1))+
  theme(axis.text.y = element_text(size =20, face = "bold")) +
  theme(text = element_text(size = 20))+
  labs(x = "Datum", y = "Covid-Fälle", title = "Covid-Fälle in Deutschland nach dem Beginn der Impfkampagne vom Dezember 2020 bis November 2021")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,2000,4000,6000))
plot_deutschland_covid_faelle_nach_impfung

#3 Graphen zusammen
library(ggpubr)
ggarrange(plot_deutschland_covid_faelle_vor_impfung,plot_deutschland_covid_faelle_nach_impfung, plot_impfquote,
          ncol = 1, nrow = 3)

  ###Plot Deutschland Hospi vs Impfquote
Hosp_data_bayern <- aggregate(data1[4], by =data1[1], FUN = sum)
View(Hosp_data_bayern)
ggplot(data = Hosp_data_bayern, mapping = aes(x = Meldedatum, y = Hospitalisierung/130.7672)) +
  geom_col() +
  theme(axis.text.x = element_text(size =18, face = "bold",angle = 45, vjust = 1, hjust = 1)) + 
  theme(axis.text.y = element_text(size =20, face = "bold")) +
  labs(x = "Datum", y = "Hospitalisierungen pro 100.000 Einwohner", title = "Hospitalisierungsinzidenz in Bayern vom April 2020 bis Oktober 2021") +
  theme(text = element_text(size =30)) +
  scale_x_date(date_labels ="%b %y",date_breaks = "4 week")

###Plot Hospitalisierungsinzidenz Bayern vs Impfquote Deutschlands
#Subset Hosp_data_bayern vor/nach der Impfung
Hosp_data_bayern_vor_impfung<-subset(Hosp_data_bayern,Meldedatum<="2020-12-27")
View(Hosp_data_bayern_vor_impfung)
Hosp_data_bayern_nach_impfung<-subset(Hosp_data_bayern,Meldedatum>="2020-12-27")
View(Hosp_data_bayern_nach_impfung)

#Plot Hosp_data_bayern vor der Impfung
plot_Hosp_data_bayern_vor_impfung<-ggplot(data =Hosp_data_bayern_vor_impfung)+
  geom_bar(aes(x=Meldedatum,y=Hospitalisierung/130.7672),stat="identity")+
  scale_x_date(date_labels ="%b %y",date_breaks = "4 week")+
  theme(axis.text.x=element_text(size =16,face = "bold",angle=45, vjust = 1, hjust = 1))+
  theme(axis.text.y = element_text(size =20, face = "bold")) +
  labs(x = "Datum", y = "Hospitalisierungsinzidenz", title = "Hospitalisierungsinzidenz in Bayern vor dem Beginn der Impfkampagne vom April 2020 bis Dezember 2020")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,1,2))+
  theme(text = element_text(size =20))
plot_Hosp_data_bayern_vor_impfung

#Plot Hosp_data_bayern nach der Impfung
plot_Hosp_data_bayern_nach_impfung<-ggplot(data =Hosp_data_bayern_nach_impfung)+
  geom_bar(aes(x=Meldedatum,y=Hospitalisierung/130.7672),stat="identity")+
  scale_x_date(date_labels ="%b %y",date_breaks = "4 week")+
  theme(axis.text.x=element_text(size =16,face = "bold",angle=45, vjust = 1, hjust = 1))+
  theme(axis.text.y = element_text(size =20, face = "bold")) +
  labs(x = "Datum", y = "Hospitalisierungsinzidenz", title = "Hospitalisierungsinzidenz in Bayern nach dem Beginn der Impfkampagne vom Dezember 2020 bis November 2021")+
  geom_vline(xintercept= as.Date(c("2020-12-27")), color = "red", size = 1)+
  scale_y_continuous(breaks=c(0,1,2))+
  theme(text = element_text(size =20))
plot_Hosp_data_bayern_nach_impfung

#3 Graphen zusammen
library(ggpubr)
ggarrange(plot_Hosp_data_bayern_vor_impfung,plot_Hosp_data_bayern_nach_impfung, plot_impfquote,
          ncol = 1, nrow = 3)
