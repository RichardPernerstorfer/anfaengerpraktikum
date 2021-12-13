# 7 -Tage Hospitalisierung pro 100000 einwohner in verschiedenen Bundesländer

# Subdatensätze
hosp <- as.data.frame(Aktuell_Deutschland_COVID_19_Hospitalisierungen)

hosp_7tage_schleswig_holstein <- subset(hosp, Bundesland_Id == "01")
hosp_7tage_hamburg <- subset(hosp, Bundesland_Id == "02")
hosp_7tage_niedersachsen <- subset(hosp, Bundesland_Id == "03")
hosp_7tage_nordrhein_westfalen <- subset(hosp, Bundesland_Id == "05")
hosp_7tage_hessen <- subset(hosp, Bundesland_Id == "06")
hosp_7tage_rheinland_pfalz <- subset(hosp, Bundesland_Id == "07")
hosp_7tage_baden_Wuerttemberg <- subset(hosp, Bundesland_Id == "08")
hosp_7tage_saarland <- subset(hosp, Bundesland_Id == "10")
hosp_7tage_berlin<- subset(hosp, Bundesland_Id == "11")
hosp_7tage_brandenburg<- subset(hosp, Bundesland_Id == "12")
hosp_7tage_mecklenburg_Vorpommern<- subset(hosp, Bundesland_Id == "13")
hosp_7tage_sachsen_anhalt<- subset(hosp, Bundesland_Id == "15")
hosp_7tage_thueringen<- subset(hosp, Bundesland_Id == "16")
hosp_7tage_deutschland <- subset(hosp, Bundesland_Id == "00")

# Hospitalisieurngsfaelle Bremen, Sachsen , Bayern & Deustchland
hosp_7tage_bremen <- subset(hosp, Bundesland_Id == "04")
bremen_hospit <- aggregate(hosp_7tage_bremen$`7T_Hospitalisierung_Faelle`, hosp_7tage_bremen[1], sum)
bremen_hospit$Datum <- as.Date(bremen_hospit$Datum)


hosp_7tage_bayern <- subset(hosp, Bundesland_Id == "09")
bayern_hospit <- aggregate(hosp_7tage_bayern$`7T_Hospitalisierung_Faelle`, hosp_7tage_bayern[1], sum)
bayern_hospit$Datum <- as.Date(bayern_hospit$Datum)

hosp_7tage_sachsen<- subset(hosp, Bundesland_Id == "14")
sachsen_hospit <- aggregate(hosp_7tage_sachsen$`7T_Hospitalisierung_Faelle`, hosp_7tage_sachsen[1], sum)
sachsen_hospit$Datum <- as.Date(sachsen_hospit$Datum)

deutschland_hospt <- aggregate(hosp_7tage_deutschland$`7T_Hospitalisierung_Faelle`, hosp_7tage_deutschland[1], sum)
deutschland_hospt$Datum <- as.Date(deutschland_hospt$Datum)

# andere Bundesländer Hospitalisierungsfälle


schleswig_holstein_hospit <- aggregate(hosp_7tage_schleswig_holstein$`7T_Hospitalisierung_Faelle`, hosp_7tage_schleswig_holstein[1], sum)
schleswig_holstein_hospit$Datum <- as.Date(schleswig_holstein_hospit$Datum)


hamburg_hospit <- aggregate(hosp_7tage_hamburg$`7T_Hospitalisierung_Faelle`, hosp_7tage_hamburg[1], sum)
hamburg_hospit$Datum <- as.Date(hamburg_hospit$Datum)


niedersachsen_hospit <- aggregate(hosp_7tage_niedersachsen$`7T_Hospitalisierung_Faelle`, hosp_7tage_niedersachsen[1], sum)
niedersachsen_hospit$Datum <- as.Date(niedersachsen_hospit$Datum)


nordrhein_westfalen_hospit <- aggregate(hosp_7tage_nordrhein_westfalen$`7T_Hospitalisierung_Faelle`, hosp_7tage_nordrhein_westfalen[1], sum)
nordrhein_westfalen_hospit$Datum <- as.Date(nordrhein_westfalen_hospit$Datum)


hessen_hospit <- aggregate(hosp_7tage_hessen$`7T_Hospitalisierung_Faelle`, hosp_7tage_hessen[1], sum)
hessen_hospit$Datum <- as.Date(hessen_hospit$Datum)


rheinland_pfalz_hospit <- aggregate(hosp_7tage_rheinland_pfalz$`7T_Hospitalisierung_Faelle`, hosp_7tage_rheinland_pfalz[1], sum)
rheinland_pfalz_hospit$Datum <- as.Date(rheinland_pfalz_hospit$Datum)


baden_Wuerttemberg_hospit <- aggregate(hosp_7tage_baden_Wuerttemberg$`7T_Hospitalisierung_Faelle`, hosp_7tage_baden_Wuerttemberg[1], sum)
baden_Wuerttemberg_hospit$Datum <- as.Date(baden_Wuerttemberg_hospit$Datum)


saarland_hospit <- aggregate(hosp_7tage_saarland$`7T_Hospitalisierung_Faelle`, hosp_7tage_saarland[1], sum)
saarland_hospit$Datum <- as.Date(saarland_hospit$Datum)


berlin_hospit <- aggregate(hosp_7tage_berlin$`7T_Hospitalisierung_Faelle`, hosp_7tage_berlin[1], sum)
berlin_hospit$Datum <- as.Date(berlin_hospit$Datum)


brandenburg_hospit <- aggregate(hosp_7tage_brandenburg$`7T_Hospitalisierung_Faelle`, hosp_7tage_brandenburg[1], sum)
brandenburg_hospit$Datum <- as.Date(brandenburg_hospit$Datum)


mecklenburg_Vorpommern_hospit <- aggregate(hosp_7tage_mecklenburg_Vorpommern$`7T_Hospitalisierung_Faelle`, hosp_7tage_mecklenburg_Vorpommern[1], sum)
mecklenburg_Vorpommern_hospit$Datum <- as.Date(mecklenburg_Vorpommern_hospit$Datum)


sachsen_anhalt_hospit <- aggregate(hosp_7tage_sachsen_anhalt$`7T_Hospitalisierung_Faelle`, hosp_7tage_sachsen_anhalt[1], sum)
sachsen_anhalt_hospit$Datum <- as.Date(sachsen_anhalt_hospit$Datum)


thueringen_hospit <- aggregate(hosp_7tage_thueringen$`7T_Hospitalisierung_Faelle`, hosp_7tage_thueringen[1], sum)
thueringen_hospit$Datum <- as.Date(thueringen_hospit$Datum)





## Plot 1

color_code2 <- c("Bayern" = "blue", "Sachsen" = "red", "Bremen" = "darkgreen", "Deutschland" = "black", , "Andere" = "grey80")

ggplot()+
  geom_line( size = 1,data = berlin_hospit, mapping = aes(x = Datum, y = ((x/ 3664088) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = brandenburg_hospit, mapping = aes(x = Datum, y = ((x/2531071) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = hamburg_hospit, mapping = aes(x = Datum, y = ((x/ 1852478) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = hessen_hospit, mapping = aes(x = Datum, y = ((x/6293154) *100000)/2, col = "Andere" )) +
  geom_line( size = 1,data = mecklenburg_Vorpommern_hospit, mapping = aes(x = Datum, y = ((x/1610774) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = niedersachsen_hospit, mapping = aes(x = Datum, y = ((x/ 8003421) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = nordrhein_westfalen_hospit, mapping = aes(x = Datum, y = ((x/17925570) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = rheinland_pfalz_hospit, mapping = aes(x = Datum, y = ((x/4098391) *100000)/2, col = "Andere" )) +
  geom_line( size = 1, data = saarland_hospit, mapping = aes(x = Datum, y = ((x/ 983991) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = sachsen_anhalt_hospit, mapping = aes(x = Datum, y = ((x/ 2180684) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = schleswig_holstein_hospit, mapping = aes(x = Datum, y = ((x/2910875) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = thueringen_hospit, mapping = aes(x = Datum, y = ((x/ 2120237) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = baden_Wuerttemberg_hospit, mapping = aes(x = Datum, y = ((x/11103043) *100000)/2, col = "Andere")) +
  geom_line( size = 2 ,data = sachsen_hospit, mapping = aes(x = Datum, y = ((x/4056941) *100000)/2 , col = "Sachsen")) +
  geom_line( size = 2, data = bremen_hospit, mapping = aes(x = Datum, y = ((x/ 680130) *100000)/2, col = "Bremen"))+
  geom_line( size = 2,data = bayern_hospit, mapping = aes(x = Datum, y = ((x/13140183) *100000)/2 , col = "Bayern")) +
  geom_line( size = 2, data = deutschland_hospt, mapping = aes(x = Datum, y = ((x/ 83129285) *100000)/2, col = "Deutschland"))+
  
  labs(x = "Datum", y = "7-Tage Hospitalisierung pro 100.000 Einwohner", title = "7-Tage Hospitalisierung in unterschiedlichen Bundesländern")+
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +

  scale_color_manual(name = "Bundesländer", values = color_code2)

 
### Plot 2 ab Oktober 2021 ( im Bezug auf 4.Welle)


bremen_hospit_ab_11_Okt <-  subset(bremen_hospit, Datum >= "2021-10-11"  )
bayern_hospit_ab_11_Okt <-  subset(bayern_hospit, Datum >= "2021-10-11"  )
sachsen_hospit_ab_11_Okt <-  subset(sachsen_hospit, Datum >= "2021-10-11" )
berlin_hospit_ab_11_Okt <-  subset(berlin_hospit, Datum >= "2021-10-11" )
brandenburg_hospit_ab_11_Okt <-  subset(brandenburg_hospit, Datum >= "2021-10-11" )
hamburg_hospit_ab_11_Okt <-  subset(hamburg_hospit, Datum >= "2021-10-11" )
hessen_hospit_ab_11_Okt <-  subset(hessen_hospit, Datum >= "2021-10-11" )
mecklenburg_Vorpommern_hospit_ab_11_Okt <-  subset( mecklenburg_Vorpommern_hospit, Datum >= "2021-10-11" )
niedersachsen_hospit_ab_11_Okt <-  subset(niedersachsen_hospit, Datum >= "2021-10-11" )
nordrhein_westfalen_hospit_ab_11_Okt <-  subset(nordrhein_westfalen_hospit, Datum >= "2021-10-11" )
rheinland_pfalz_hospit_ab_11_Okt <-  subset(rheinland_pfalz_hospit, Datum >= "2021-10-11" )
saarland_hospit_ab_11_Okt <-  subset(saarland_hospit, Datum >= "2021-10-11" )
sachsen_anhalt_hospit_ab_11_Okt <-  subset(sachsen_anhalt_hospit, Datum >= "2021-10-11" )
thueringen_hospit_ab_11_Okt <-  subset(thueringen_hospit, Datum >= "2021-10-11" )
baden_Wuerttemberg_hospit_ab_11_Okt <-  subset(baden_Wuerttemberg_hospit, Datum >= "2021-10-11" )
deutschland_hospt_ab_11_Okt <-  subset(deutschland_hospt, Datum >= "2021-10-11" )
schleswig_holstein_hospit_ab_11_Okt <-  subset(schleswig_holstein_hospit, Datum >= "2021-10-11" )



color_code3 <- c("Bayern (Impfquote: 69,9%)" = "blue", "Sachsen (Impfquote: 61,4%)" = "red", "Bremen (Impfquote: 84,3%)" = "darkgreen", "Andere"="grey80",
"Deutschland" = "black")
 
ggplot()+
  geom_line( size = 1,data = berlin_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 3664088) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = brandenburg_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/2531071) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = hamburg_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 1852478) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = hessen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/6293154) *100000)/2, col = "Andere" )) +
  geom_line( size = 1,data = mecklenburg_Vorpommern_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/1610774) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = niedersachsen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 8003421) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = nordrhein_westfalen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/17925570) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = rheinland_pfalz_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/4098391) *100000)/2, col = "Andere" )) +
  geom_line( size = 1, data = saarland_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 983991) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = sachsen_anhalt_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 2180684) *100000)/2 , col = "Andere")) +
  geom_line( size = 1,data = schleswig_holstein_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/2910875) *100000)/2 , col = "Andere")) +
  geom_line( size = 1, data = thueringen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 2120237) *100000)/2, col = "Andere"))+
  geom_line( size = 1,data = baden_Wuerttemberg_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/11103043) *100000)/2, col = "Andere")) +
  geom_line( size = 2,data = sachsen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/4056941) *100000)/2 , col = "Sachsen (Impfquote: 61,4%)")) +
  geom_line( size = 2,data = bayern_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/13140183) *100000)/2 , col = "Bayern (Impfquote: 69,9%)")) +
  geom_line( size = 2, data = bremen_hospit_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 680130) *100000)/2, col = "Bremen (Impfquote: 84,3%)"))+
  geom_line( size = 2, data = deutschland_hospt_ab_11_Okt, mapping = aes(x = Datum, y = ((x/ 83129285) *100000)/2, col = "Deutschland"))+
  
  labs(x = "Datum", y = "7-Tage Hospitalisierung pro 100.000 Einwohner", title = "7-Tage Hospitalisierung in unterschiedlichen Bundesländern in der 4.Welle")+
  scale_x_date(date_breaks = "1 week", date_labels =  "%b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +
  scale_color_manual(name = "Bundesländer", values = color_code3)
  
