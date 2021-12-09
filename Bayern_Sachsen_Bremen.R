RKI_COVID19_Bayern <- read_csv("RKI_COVID19_Bayern.csv")
Bayern_Infektionen <- aggregate(RKI_COVID19_Bayern$AnzahlFall, RKI_COVID19_Bayern[9], sum)
Bayern_Infektionen$Meldedatum <- as.Date(Bayern_Infektionen$Meldedatum)

RKI_COVID19_Sachsen <- read_csv("RKI_COVID19_Sachsen.csv")
Sachsen_Infektionen <- aggregate(RKI_COVID19_Sachsen$AnzahlFall, RKI_COVID19_Sachsen[9], sum)
Sachsen_Infektionen$Meldedatum <- as.Date(Sachsen_Infektionen$Meldedatum)

RKI_COVID19_Bremen <- read_csv("RKI_COVID19_Bremen.csv")
Bremen_Infektionen <- aggregate(RKI_COVID19_Bremen$AnzahlFall, RKI_COVID19_Bremen[9], sum)
Bremen_Infektionen$Meldedatum <- as.Date(Bremen_Infektionen$Meldedatum)

color_code <- c("Bayern (Impfquote: 69,9%)" = "blue", "Sachsen (Impfquote: 61,4%)" = "red", "Bremen (Impfquote: 84,3%)" = "darkgreen")

ggplot()+
  geom_line( size = 1.5,data = Sachsen_Infektionen, mapping = aes(x = Meldedatum, y = x/40.78, col = "Sachsen (Impfquote: 61,4%)")) +
  geom_line( size = 1.5,data = Bayern_Infektionen, mapping = aes(x = Meldedatum, y = x / 130.8, col = "Bayern (Impfquote: 69,9%)")) +
  geom_line( size = 1.5, data = Bremen_Infektionen, mapping = aes(x = Meldedatum, y = x/ 5.69352, col = "Bremen (Impfquote: 84,3%)"))+
  labs(x = "Datum", y = "Infektionen pro 100.000 Einwohner", title = "Infektionen in unterschiedlichen Bundesländern")+
  scale_x_date(date_breaks = "2 month", date_labels = "%d %b %y") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +
  scale_color_manual(name = "Linien Farben", values = color_code)
  
ggplot()+
  geom_line( size = 1.5,data = subset(Sachsen_Infektionen, Meldedatum >= "2021-09-01" & Meldedatum <= "2021-12-01"), mapping = aes(x = Meldedatum, y = x/40.78, col = "Sachsen (Impfquote: 61,4%)")) +
  geom_line( size = 1.5,data = subset(Bayern_Infektionen, Meldedatum >= "2021-09-01" & Meldedatum <= "2021-12-01"), mapping = aes(x = Meldedatum, y = x / 130.8, col = "Bayern (Impfquote: 69,9%)")) +
  geom_line( size = 1.5, data = subset(Bremen_Infektionen, Meldedatum >= "2021-09-01" & Meldedatum <= "2021-12-01"), mapping = aes(x = Meldedatum, y = x/ 5.69352, col = "Bremen (Impfquote: 84,3%)"))+
  labs(x = "Datum", y = "Infektionen pro 100.000 Einwohner", title = "Infektionen in unterschiedlichen Bundesländern in der 4. Welle")+
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d") +  
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
  theme(text = element_text(size = 30)) +
  scale_color_manual(name = "Linien Farben", values = color_code)
