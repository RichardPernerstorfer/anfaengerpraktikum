library(ggplot2)
library(lubridate)
### covid fälle um die IAA
# Fälle IAA Deutschland
ggplot(data = data_IAA_germany, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA deutschlandweit") + 
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)
# Fälle IAA Bayern
ggplot(data = data_IAA_bayern, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA bayernweit") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)
# Fälle IAA München
ggplot(data = data_IAA_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA in München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)
# Fälle IAA Bayern ohne München
ggplot(data = data_IAA_bayern_ohne_muenchen, aes(x = date, y = faelle_covid_aktuell)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "aktuelle Covid-Fälle", title = "Aktuelle Covid-Fälle um die IAA in Bayern ohne München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)
# Belegte Intensivbetten IAA
ggplot() + 
  geom_bar(aes(y = betten_belegt + betten_frei, x = date), data = data_IAA_muenchen, stat = "identity") + 
  geom_bar(aes(y = betten_belegt, x = date), data = data_IAA_muenchen, stat = "identity", fill = "red", alpha = 0.6) + 
  labs(x = "Datum", y = "Intensivbetten absolut ", title = "Intensivbetten in München") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)
# belegte Intensivbetten Prozent
ggplot(data = data_IAA_muenchen, aes(x = date, y = betten_anteil)) +
  geom_bar(stat="identity") + 
  labs(x = "Datum", y = "Anteil belegter Intensivbetten", title = "Anteil belegter Intensivbetten in München um IAA") +
  annotate("rect", fill = "pink", alpha = 0.4, 
           xmin = as.Date(c("2021-09-07")), xmax = as.Date(c("2021-09-12")),
           ymin = 0, ymax = Inf)

  
