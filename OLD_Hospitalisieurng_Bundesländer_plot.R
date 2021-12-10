new_icu_fed_adj <- read_csv("2021-11-02_new_icu_fed_adj.csv")
new_icu_fed_adj$date <- as.Date(new_icu_fed_adj$date, "%d-%m-%y")

## Teildatensätze
icu_baden_württemberg <- subset(new_icu_fed_adj, state == "Baden-Württemberg")
icu_bayern <- subset(new_icu_fed_adj, state == "Bayern")
icu_hessen <- subset(new_icu_fed_adj, state == "Hessen")
icu_mecklenburg_vorpommern <- subset(new_icu_fed_adj, state == "Mecklenburg-Vorpommern")
icu_nordrhein_westfalen <- subset(new_icu_fed_adj, state == "Nordrhein-Westfalen")
icu_rheinland_pfalz <- subset(new_icu_fed_adj, state == "Rheinland-Pfalz")
icu_saarland <- subset(new_icu_fed_adj, state == "Saarland")
icu_sachsen <- subset(new_icu_fed_adj, state == "Sachsen")
icu_sachsen_anhalt <- subset(new_icu_fed_adj, state == "Sachsen-Anhalt")
icu_thuringen <- subset(new_icu_fed_adj, state == "Thüringen")
icu_Berlin_Brandenburg <- subset(new_icu_fed_adj, state == "Berlin & Brandenburg")
icu_Hamburg_SchleswigHolstein <- subset(new_icu_fed_adj, state == "Hamburg & Schleswig-Holstein")
icu_Bremen_Niedersachsen <- subset(new_icu_fed_adj, state == "Bremen & Niedersachsen")

icu_deutschland <- as.data.frame(icu_bayern$date)

icu_deutschland$med_adj <- icu_baden_württemberg$med_adj + icu_bayern$med_adj + icu_hessen$med_adj +icu_mecklenburg_vorpommern$med_adj +
  icu_nordrhein_westfalen$med_adj + icu_rheinland_pfalz$med_adj + icu_saarland$med_adj + icu_sachsen$med_adj +
  icu_sachsen_anhalt$med_adj + icu_thuringen$med_adj + icu_Berlin_Brandenburg$med_adj + icu_Hamburg_SchleswigHolstein$med_adj +
  icu_Bremen_Niedersachsen$med_adj

icu_deutschland$state <- "Deutschland"

# Rechnung pro 100.000:
icu_baden_württemberg$med_adj_rate <- (icu_baden_württemberg$med_adj/11103043) *100000
icu_bayern$med_adj_rate <-  (icu_bayern$med_adj/13140183) *100000
icu_hessen$med_adj_rate <- (icu_hessen$med_adj / 6293154) *100000
icu_mecklenburg_vorpommern$med_adj_rate <- (icu_mecklenburg_vorpommern$med_adj /1610774) *100000
icu_nordrhein_westfalen$med_adj_rate <- (icu_nordrhein_westfalen$med_adj/17925570) *100000
icu_rheinland_pfalz$med_adj_rate <- (icu_rheinland_pfalz$med_adj/ 4098391) *100000
icu_saarland$med_adj_rate <- (icu_saarland$med_adj/ 983991) *100000
icu_sachsen$med_adj_rate <- (icu_sachsen$med_adj/4056941) *100000
icu_sachsen_anhalt$med_adj_rate <- (icu_sachsen_anhalt$med_adj /2180684) *100000
icu_thuringen$med_adj_rate <- (icu_thuringen$med_adj/  2120237) *100000
icu_Berlin_Brandenburg$med_adj_rate <- (icu_Berlin_Brandenburg$med_adj /(3664088 + 2531071)) *100000
icu_Hamburg_SchleswigHolstein$med_adj_rate <- (icu_Hamburg_SchleswigHolstein$med_adj / (2910875 + 1852478)) *100000
icu_Bremen_Niedersachsen$med_adj_rate <- (icu_Bremen_Niedersachsen$med_adj /(8003421 +  680130)) *100000
icu_deutschland$med_adj_rate <- (icu_deutschland$med_adj / 83129285) * 100000
  
# Plot 1 Hosptialisierung je Bundesland pro Tag

hosp <- ggplot() + 
  geom_line(aes(x = date, y =  med_adj_rate, color = state), size = 2, data = icu_baden_württemberg)+
  geom_line(aes(x = date, y =  med_adj_rate, color = state), size = 2, data = icu_hessen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_mecklenburg_vorpommern)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_nordrhein_westfalen)+
  geom_line(aes(x = date, y =   med_adj_rate , color = state), size = 2, data = icu_rheinland_pfalz)+
  geom_line(aes(x = date, y =   med_adj_rate , color = state), size = 2, data = icu_saarland)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_sachsen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_sachsen_anhalt)+
  geom_line(aes(x = date, y =  med_adj_rate , color = state), size = 2, data = icu_thuringen)+
  geom_line(aes(x = date, y =  med_adj_rate , color = state), size = 2, data = icu_Berlin_Brandenburg)+
  geom_line(aes(x = date, y = med_adj_rate, color = state), size = 2, data = icu_Hamburg_SchleswigHolstein)+
  geom_line(aes(x = date, y =  med_adj_rate, color = state), size = 2, data = icu_Bremen_Niedersachsen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_bayern) +
  geom_line(aes(x = icu_bayern$date, y =   med_adj_rate, color = state), size = 2, data = icu_deutschland) +
  scale_x_date( date_breaks = "1 month") +
  ggtitle("Anzahl der Patienten in ICU in verschiedenen Bundesländer pro Tag ") +
  xlab("Datum") + ylab(" Anzahl der Patienten auf der Intensivstation pro 100.000") +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 25)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1)) +
  scale_color_discrete(name = "Bundesländer & Deutschland")
  
  
hosp

##Plot 2 nur Bayern Highlight
library(tidyverse)

 hosp2 <- ggplot() + 
  geom_line(aes(x = date, y =  med_adj_rate, color = state, group = state), size = 2, data = icu_baden_württemberg)+
  geom_line(aes(x = date, y =  med_adj_rate, color = state,group = state), size = 2, data = icu_hessen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_mecklenburg_vorpommern)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_nordrhein_westfalen)+
  geom_line(aes(x = date, y =   med_adj_rate , color = state,group = state), size = 2, data = icu_rheinland_pfalz)+
  geom_line(aes(x = date, y =   med_adj_rate , color = state,group = state), size = 2, data = icu_saarland)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_sachsen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_sachsen_anhalt)+
  geom_line(aes(x = date, y =  med_adj_rate , color = state,group = state), size = 2, data = icu_thuringen)+
  geom_line(aes(x = date, y =  med_adj_rate , color = state,group = state), size = 2, data = icu_Berlin_Brandenburg)+
  geom_line(aes(x = date, y = med_adj_rate, color = state,group = state), size = 2, data = icu_Hamburg_SchleswigHolstein)+
  geom_line(aes(x = date, y =  med_adj_rate, color = state,group = state), size = 2, data = icu_Bremen_Niedersachsen)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_bayern) +
  geom_line(aes(x = icu_bayern$date, y =   med_adj_rate, color = state), size = 2, data = icu_deutschland) +
  scale_x_date( date_breaks = "1 month") +
  ggtitle("Anzahl der Patienten in ICU in verschiedenen Bundesländer pro Tag ") +
  xlab("Datum") + ylab(" Anzahl der Patienten auf der Intensivstation pro 100.000") +
  theme(axis.text.x = element_text(size = 18, face = "bold")) + 
  theme(axis.text.y = element_text(size = 18)) +
  theme(text = element_text(size = 20)) +
  theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1)) + 
  gghighlight(icu_bayern, state == "Bayern", use_direct_label = FALSE)

 hosp2
                  

 ### Plot 3
 
 ggplot() + 
   geom_line(aes(x = date, y =  med_adj_rate, color = state, group = state), size = 1, data = icu_baden_württemberg)+
   geom_line(aes(x = date, y =  med_adj_rate, color = state,group = state), size = 1, data = icu_hessen)+
   geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 1, data = icu_mecklenburg_vorpommern)+
   geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 1, data = icu_nordrhein_westfalen)+
   geom_line(aes(x = date, y =   med_adj_rate , color = state,group = state), size = 1, data = icu_rheinland_pfalz)+
   geom_line(aes(x = date, y =   med_adj_rate , color = state,group = state), size = 1, data = icu_saarland)+
   geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_sachsen)+
   geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 1, data = icu_sachsen_anhalt)+
   geom_line(aes(x = date, y =  med_adj_rate , color = state,group = state), size = 1, data = icu_thuringen)+
   geom_line(aes(x = date, y =  med_adj_rate , color = state,group = state), size = 2, data = icu_Berlin_Brandenburg)+
   geom_line(aes(x = date, y = med_adj_rate, color = state,group = state), size = 2, data = icu_Hamburg_SchleswigHolstein)+
   geom_line(aes(x = date, y =  med_adj_rate, color = state,group = state), size = 2, data = icu_Bremen_Niedersachsen)+
   geom_line(aes(x = date, y =   med_adj_rate, color = state,group = state), size = 2, data = icu_bayern) +
   geom_line(aes(x = icu_bayern$date, y =   med_adj_rate, color = state), size = 2, data = icu_deutschland)+
   scale_x_date( date_breaks = "1 month", date_labels  = "%b %y") +
   ggtitle("Anzahl der Patienten in ICU in Deutschland ") +
   xlab("Datum") + ylab(" Anteil der Patienten auf der Intensivstation pro 100.000") +
   theme(axis.text.x = element_text(size = 18, face = "bold")) + 
   theme(axis.text.y = element_text(size = 18)) +
   theme(text = element_text(size = 25)) +
   theme(axis.text.x=element_text(angle = 45, hjust = 1, vjust = 1)) + 
  
   scale_colour_manual(name = "Bundesländer & Deutschland", labels = c("Baden-Württemberg", "Bayern", "Berlin & Brandenburg",  "Bremen & Niedersachsen","Deutschland", "Hamburg & Schleswig-Holstein", 
                                  "Hessen", "Mecklenburg-Vorpommern", "Nordrhein-Westfalen", "Rheinland-Pfalz",
                                 "Saarland", "Sachsen", "Sachsen-Anhalt", "Thüringen"), 
                      values = c("grey78", "blue", "grey78", "grey78", "red", "grey78", "grey78", "grey78", "grey78",
                                 "grey78","grey78", "grey78","grey78", "grey78"))
