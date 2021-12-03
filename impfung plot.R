library(ggplot2)
color_code<-c("Impfquote erst"="lightgreen",
                "Impfquote voll"="darkgreen")
plot_impfquote<-ggplot()+ 
  geom_line(aes(x =date,y=impf_quote_erst,col="Impfquote erst"), linetype=1,size=1,data = vaccination_timeseries)+
  geom_line(aes(x =date,y=impf_quote_voll,col="Impfquote voll"), linetype=1,size=1,data = vaccination_timeseries)+
  labs(x = "Datum", y = "Impfquote", title = "Impfquote in Deutschland")+
  scale_colour_manual(name = "Linien Farben",
                      values = color_code)+
  scale_x_date(date_labels = "%b %d",date_breaks = "4 week")+
  theme(axis.text.x=element_text(angle=50, hjust=1))
plot_impfquote

