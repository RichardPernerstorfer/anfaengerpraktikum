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

# Plot 1 Hosptialisierung je Bundesland pro Tag

ggplot() + 
  geom_line(aes(x = date, y =  med_adj_rate, color = state), size = 2, data = icu_baden_württemberg)+
  geom_line(aes(x = date, y =   med_adj_rate, color = state), size = 2, data = icu_bayern) +
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
  scale_x_date( date_labels = "%b %d ", date_breaks = "1 month") +
  ggtitle("Anzahl der Patienten in ICU in verschiedenen Staaten pro Tag ") +
  xlab("Datum") + ylab(" Anzahl der Neuaufnahmen auf der Intensivstation pro 100.000") +
  theme(text = element_text(size = 25)) 

# Plot
  






