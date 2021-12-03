library(ggplot2)

ggplot() + 
  geom_line(aes(x = date, y = A0_bis_A4, group = 1, color = "Altergruppe 0 bis 4"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A5_bis_A15, group = 1, color = "Altergruppe 5 bis 15"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A15_bis_A34, group = 1, color = "Altergruppe 15 bis 34" ), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A35_bis_A59, group = 1, color = "Altergruppe 35 bis 59"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A60_bis_A79, group = 1, color = "Altergruppe 60 bis 79"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A80_plus, group = 1, color = "Altergruppe 80 +"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  theme(axis.text.x = element_text(size = 12, face = "bold")) + 
  theme(axis.text.y = element_text(size = 12)) +
  labs(x = "Datum in Kalenderwochen", y = "Hospitalisierungen", title = "Hospitalisierungen nach Altersgruppe in Deutschland", color = "Altersgruppen") +
  theme(text = element_text(size = 40)) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

ggplot() + 
  geom_line(aes(x = date, y = A0_bis_A4 / 39.69138, group = 1, color = "Altergruppe 0 bis 4"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A5_bis_A15 / 82.5288, group = 1, color = "Altergruppe 5 bis 15"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A15_bis_A34 / 189.2129, group = 1, color = "Altergruppe 15 bis 34" ), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A35_bis_A59 / 286.6617, group = 1, color = "Altergruppe 35 bis 59"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A60_bis_A79 / 181.5334, group = 1, color = "Altergruppe 60 bis 79"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  geom_line(aes(x = date, y = A80_plus / 59.36434, group = 1, color = "Altergruppe 80 +"), size = 2, data = Fälle_Hospitalisierung_Alter) +
  theme(axis.text.x = element_text(size = 12, face = "bold")) + 
  theme(axis.text.y = element_text(size = 12, face = "bold")) +
  labs(x = "Datum in Kalenderwochen", y = "Covid-Inzidenz", title = "Hospitalisierungs-Inzidenz pro Altersgruppe in Deutschland", color = "Altersgruppen") +
  theme(text = element_text(size = 40)) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
