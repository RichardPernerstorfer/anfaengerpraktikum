library(ggplot2)
library(lubridate)
library(ggpubr)
### covid fälle um die IAA

# Fälle IAA Deutschland unused
ggplot(data = data_IAA_germany, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA deutschlandweit") + 
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf) +
  scale_x_date(date_breaks = "1 week") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

# Fälle IAA Bayern
IAA_bayern_plot <- ggplot(data = data_IAA_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA bayernweit") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") + 
 theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 30))
IAA_bayern_plot

# Fälle IAA München
IAA_muenchen_plot <- ggplot(data = data_IAA_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA in München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") + 
theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 30))
IAA_muenchen_plot

#Zusammenhängende Grafik
ggarrange(IAA_bayern_plot, IAA_muenchen_plot, nrow = 2)

# Fälle IAA Bayern ohne München unused
ggplot(data = data_IAA_bayern_ohne_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA in Bayern ohne München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

# Fälle IAA Anteil München an Bayern
ggplot(data = data_IAA_muenchen, aes(y = anteil, x = date)) + 
  geom_line() + 
  labs(x = "Datum", y = "Anteil aktueller Covid-Fälle", title = "Anteil der bayerischen Covid-Fälle von München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
 annotate("rect", fill = "blue", alpha = 0.4, 
           xmin = as.Date(c("2021-09-14")), xmax = as.Date(c("2021-09-19")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") + 
  theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 30))


# Belegte Intensivbetten IAA
ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_IAA_muenchen, stat = "identity", fill = "blue") + 
  geom_bar(aes(y = betten_belegt, x = date), data = data_IAA_muenchen, stat = "identity") + 
  labs(x = "Datum", y = "Intensivbetten absolut ", title = "Intensivbetten in München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
annotate("rect", fill = "plum4", alpha = 0.4, 
           xmin = as.Date(c("2021-09-21")), xmax = as.Date(c("2021-09-26")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") + 
   theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 30))

# belegte Intensivbetten Prozent
ggplot(data = data_IAA_muenchen, aes(x = date, y = betten_anteil)) +
  geom_line(stat="identity") + 
  labs(x = "Datum", y = "Anteil belegter Intensivbetten", title = "Anteil belegter Intensivbetten in München um IAA") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)  +
annotate("rect", fill = "plum4", alpha = 0.4, 
           xmin = as.Date(c("2021-09-21")), xmax = as.Date(c("2021-09-26")),
           ymin = 0, ymax = Inf)  +
  scale_x_date(date_breaks = "1 week") +  
theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
  theme(axis.text.y = element_text(size = 18, face = "bold")) +
 theme(text = element_text(size = 30))

  
