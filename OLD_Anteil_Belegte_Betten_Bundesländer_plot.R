### Bundesland 1

library(dplyr)

# Einwohnerzahl aus  : https://de.wikipedia.org/wiki/Liste_der_deutschen_Bundesl%C3%A4nder_nach_Bev%C3%B6lkerung

## Subset 
divi_schleswig_holstein <- subset(divi_17_11, bundesland == "01")
divi_hamburg <- subset(divi_17_11, bundesland == "02")
divi_niedersachsen <- subset(divi_17_11, bundesland == "03")
divi_bremen <- subset(divi_17_11, bundesland == "04")
divi_nordrhein_westfalen <- subset(divi_17_11, bundesland == "05")
divi_hessen <- subset(divi_17_11, bundesland == "06")
divi_rheinland_pfalz <- subset(divi_17_11, bundesland == "07")
divi_baden_Wuerttemberg <- subset(divi_17_11, bundesland == "08")
divi_bayern <- subset(divi_17_11, bundesland == "09")
divi_saarland <- subset(divi_17_11, bundesland == "10")
divi_berlin<- subset(divi_17_11, bundesland == "11")
divi_brandenburg<- subset(divi_17_11, bundesland == "12")
divi_mecklenburg_Vorpommern<- subset(divi_17_11, bundesland == "13")
divi_sachsen<- subset(divi_17_11, bundesland == "14")
divi_sachsen_anhalt<- subset(divi_17_11, bundesland == "15")
divi_thueringen<- subset(divi_17_11, bundesland == "16")








b1_covinv_agg <- aggregate(divi_schleswig_holstein$betten_belegt, divi_schleswig_holstein[1], sum)
b1_covinv_agg$anteil_betten <- (b1_covinv_agg$x  / 2910875) *100000
b1 <- as.data.frame(b1_covinv_agg)
b1_covinv_agg$bundesland <- "Schleswig-Holstein"

## 2 Hamburg

b2_covinv_agg <- aggregate(divi_hamburg$betten_belegt, divi_hamburg[1], sum)
b2_covinv_agg$anteil_betten <- (b2_covinv_agg$x  / 1852478) *100000
b2 <- as.data.frame(b2_covinv_agg)
b2_covinv_agg$bundesland <- "Hamburg"

## 3 Niedersachsen
b3_covinv_agg <- aggregate(divi_niedersachsen$betten_belegt, divi_niedersachsen[1], sum)
b3_covinv_agg$anteil_betten <- (b3_covinv_agg$x  / 8003421) *100000
b3 <- as.data.frame(b3_covinv_agg)
b3_covinv_agg$bundesland <- "Niedersachsen"

## 4 Bremen

b4_covinv_agg <- aggregate(divi_bremen$betten_belegt, divi_bremen[1], sum)
b4_covinv_agg$anteil_betten<- (b4_covinv_agg$x  / 680130) *100000
b4 <- as.data.frame(b4_covinv_agg)
b4_covinv_agg$bundesland <- "Bremen"

## 5 Nordrhein-Westfalen

b5_covinv_agg <- aggregate(divi_nordrhein_westfalen$betten_belegt, divi_nordrhein_westfalen[1], sum)
b5_covinv_agg$anteil_betten <- (b5_covinv_agg$x  / 17925570) *100000
b5 <- as.data.frame(b5_covinv_agg)
b5_covinv_agg$bundesland <- "Nordrhein-Westfalen"


## 6 Hessen
b6_covinv_agg <- aggregate(divi_hessen$betten_belegt, divi_hessen[1], sum)
b6_covinv_agg$anteil_betten <- (b6_covinv_agg$x  / 6293154) *100000
b6 <- as.data.frame(b6_covinv_agg)
b6_covinv_agg$bundesland <- "Hessen"

## 7 Rheinland-Pfalz

b7_covinv_agg <- aggregate(divi_rheinland_pfalz$betten_belegt, divi_rheinland_pfalz[1], sum)
b7_covinv_agg$anteil_betten <- (b7_covinv_agg$x  / 4098391)*100000 
b7 <- as.data.frame(b7_covinv_agg)
b7_covinv_agg$bundesland <- "Rheinland-Pfalz"

## 8 Baden-Wuürttemberg
b8_covinv_agg <- aggregate(divi_baden_Wuerttemberg$betten_belegt, divi_baden_Wuerttemberg[1], sum)
b8_covinv_agg$anteil_betten <- (b8_covinv_agg$x  / 11103043) *100000
b8 <- as.data.frame(b8_covinv_agg)
b8_covinv_agg$bundesland <- "Baden-Württemberg"

## 9 Bayern
b9_covinv_agg <- aggregate(divi_bayern$betten_belegt, divi_bayern[1], sum)
b9_covinv_agg$anteil_betten <- (b9_covinv_agg$x  / 13140183) *100000
b9 <- as.data.frame(b9_covinv_agg)
b9_covinv_agg$bundesland <- "Bayern"

## 10 Saarland
b10_covinv_agg <- aggregate(divi_saarland$betten_belegt, divi_saarland[1], sum)
b10_covinv_agg$anteil_betten <- (b10_covinv_agg$x  / 983991) *100000
b10 <- as.data.frame(b10_covinv_agg)
b10_covinv_agg$bundesland <- "Saarland"

## 11 Berlin
b11_covinv_agg <- aggregate(divi_berlin$betten_belegt, divi_berlin[1], sum)
b11_covinv_agg$anteil_betten <- (b11_covinv_agg$x  / 3664088) *100000
b11 <- as.data.frame(b11_covinv_agg)
b11_covinv_agg$bundesland <- "Berlin"

## 12 Brandenburg
b12_covinv_agg <- aggregate(divi_brandenburg$betten_belegt, divi_brandenburg[1], sum)
b12_covinv_agg$anteil_betten <- (b12_covinv_agg$x  /2531071) *100000
b12 <-as.data.frame(b12_covinv_agg)
b12_covinv_agg$bundesland <- "Brandenburg"

##13 Mecklenburg-Vorpommern
b13_covinv_agg <- aggregate(divi_mecklenburg_Vorpommern$betten_belegt, divi_mecklenburg_Vorpommern[1], sum)
b13_covinv_agg$anteil_betten <- (b13_covinv_agg$x  / 1610774) *100000
b13 <-as.data.frame(b13_covinv_agg)
b13_covinv_agg$bundesland <- "Mecklenburg-Vorpommern"

## 14 Sachsen
b14_covinv_agg <- aggregate(divi_sachsen$betten_belegt, divi_sachsen[1], sum)
b14_covinv_agg$anteil_betten <- (b14_covinv_agg$x  / 4056941) *100000
b14 <-as.data.frame(b14_covinv_agg)
b14_covinv_agg$bundesland <- "Sachsen"

## 15 Sachsen-Anhalt
b15_covinv_agg <- aggregate(divi_sachsen_anhalt$betten_belegt, divi_sachsen_anhalt[1], sum)
b15_covinv_agg$anteil_betten <- (b15_covinv_agg$x  / 2180684) *100000
b15 <-as.data.frame(b15_covinv_agg)
b15_covinv_agg$bundesland <- "Sachsen-Anhalt"

## 16 Thüringen
b16_covinv_agg <- aggregate(divi_thueringen$betten_belegt, divi_thueringen[1], sum)
b16_covinv_agg$anteil_betten <- (b16_covinv_agg$x  / 2120237) *100000
b16 <- as.data.frame(b16_covinv_agg)
b16_covinv_agg$bundesland <- "Thüringen"


ggplot() + 
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1, data = b1_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1, data = b2_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b3_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b4_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,size = 2,data = b5_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b6_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b7_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b8_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b9_covinv_agg,inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b10_covinv_agg,inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b11_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b12_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b13_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b14_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b15_covinv_agg, inherit.aes = FALSE)+
  geom_line(aes(x = date, y =  anteil_betten, group = 1, color = bundesland), size = 1,data = b16_covinv_agg, inherit.aes = FALSE)+
  
  scale_x_date( date_labels = "%b %d ", date_breaks = "1 month") +
  ggtitle("Anzahl der belegten Betten in verschiedenen Bundesländer pro Tag ") +
  xlab("Datum") + ylab(" Anzahl der belegten Betten pro 100.000") +
  theme(text = element_text(size = 10)) 







## Datum

datum  <- b1_covinv_agg$date
datum








## Alles combinieren
gesamt <- rbind( b1_inzidenz_covbetten, b2_inzidenz_covbetten, b3_inzidenz_covbetten, b4_inzidenz_covbetten, b5_inzidenz_covbetten, b6_inzidenz_covbetten,
                 b7_inzidenz_covbetten, b8_inzidenz_covbetten, b9_inzidenz_covbetten, b10_inzidenz_covbetten, b11_inzidenz_covbetten,
                 b12_inzidenz_covbetten, b13_inzidenz_covbetten, b14_inzidenz_covbetten, b15_inzidenz_covbetten, b16_inzidenz_covbetten)
gesamt

# Transpose 
gesamt_transpose <- t(gesamt)
as.data.frame(gesamt_transpose)

# Datum mit addieren

Anteil_CovInv_gesamt_Population <- merge(datum, gesamt_transpose)

# Colnames
colnames(Anteil_CovInv_gesamt_Population) <- c("Datum", "Schleswig_Holstein", "Hamburg", "Niedersachsen", "Bremen", "Nordrhein_Westfalen", 
                                               "Hessen", "Rheinland_Pfalz",  "Baden_Würtemberg", "Bayern", "Saarland", "Berlin", 
                                               "Brandenburg", "Mecklenburg_Vorpommern", "Sachsen", 
                                "Sachen_Anhalt", "Thüringen")


### Plot 
library(ggplot2)

ggplot() + 
  geom_line(aes(x = Datum, y = Schleswig_Holstein, group = 1, color = "Schleswig_Holstein"), size = 2, data = Anteil_CovInv_gesamt_Population) +
  geom_line(aes(x = Datum, y = Hamburg, group = 1, color = "Hamburg"), size = 2, data = Anteil_CovInv_gesamt_Population) +
  
  theme(axis.text.x = element_text(size = 12, face = "bold")) + 
  theme(axis.text.y = element_text(size = 12)) +
  labs(x = "Datum", y = "Covid-Invasiv-beatmet Inzidenz", title = "Covid Invasiv beatmet Inzidenz je Bundesland", color = "Bundesländer") +
  theme(text = element_text(size = 40)) 

str(Anteil_CovInv_gesamt_Population)



geom_line(aes(x = Datum, y = Niedersachsen, group = 1, color = "Niedersachsen" ), size = 2, data = Anteil_CovInv_gesamt_Population) +
  geom_line(aes(x = Datum, y = Bremen, group = 1, color = "Bremen"), size = 2, data = Anteil_CovInv_gesamt_Population) +
  geom_line(aes(x = Datum, y = Nordrhein_Westfalen, group = 1, color = "Nordrhein_Westfalen"), size = 2, data = Anteil_CovInv_gesamt_Population) +
  geom_line(aes(x = Datum, y = Hessen, group = 1, color = "Hessen"), size = 2, data = Anteil_CovInv_gesamt_Population) +
  geom_line(aes(x = Datum, y = Rheinland_Pfalz, group = 1, color = "Rheinland_Pfalz"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  
geom_line(aes(x = Datum, y = Baden_Würtemberg, group = 1, color = "Baden_Würtemberg"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Bayern, group = 1, color = "Bayern"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Saarland, group = 1, color = "Saarland"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Berlin, group = 1, color = "Berlin"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Brandenburg, group = 1, color = "Brandenburg"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Mecklenburg_Vorpommern, group = 1, color = "Mecklenburg_Vorpommern"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Sachsen, group = 1, color = "Sachsen"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Sachen_Anhalt, group = 1, color = "Sachen_Anhalt"), size = 2, data = Anteil_CovInv_gesamt_Population)+
  geom_line(aes(x = Datum, y = Thüringen, group = 1, color = "Thüringen"), size = 2, data = Anteil_CovInv_gesamt_Population) 








