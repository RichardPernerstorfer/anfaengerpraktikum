### Infektionen pro 100.000 Einwohner Deutschland-Bayern

color_code <- c("Bayern" = "blue", "Deutschland" = "red")

ggplot(data = inzidenz_bundeslaender, aes(x = dates, y = inzidenz, group = bundeslaender)) +
       geom_line(alpha = 0.5) +
       geom_line(data = inzidenz_bayern_germany, aes( x = dates, y = inzidenz, col = "Bayern"), size = 1.5) +
       geom_line(data = inzidenz_bayern_germany, aes(x = dates, y = germany, col = "Deutschland"), size = 1.5) +
       labs(x = "Datum", y = "Covid-Fälle pro 100.000 Einwohner",
            title = "Aktuelle Covid-Fälle pro 100.000 Einwohner in den Bundesländer Deutschlands
             von April 2020 bis November 2021") +
       scale_colour_manual(values = color_code, name = "") +
       scale_x_date(date_breaks = "1 month", date_labels = "%b %y")+
       theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
       theme(axis.text.y = element_text(size = 18, face = "bold")) +
       theme(text = element_text(size = 30))

### Infektionen pro 100.000 Einwohner Bundesländer
 
ggplot(data = inzidenz_bundeslaender, aes(x = dates, y = inzidenz, col = bundeslaender)) +
   geom_line(size = 1.25) +
   labs(x = "Datum", y = "Covid-Fälle pro 100.000 Einwohner",
        title = "Aktuelle Covid-Fälle pro 100.000 Einwohner in den Bundesländer Deutschlands
             von April 2020 bis November 2021") + 
   scale_colour_hue(labels = c("Schleswig-Holstein", "Hamburg", "Niedersachsen", "Bremen", "Nordrhein-Westfalen",
                                "Hessen", "Rheinland-Pfalz", "Baden-Württemberg", "Bayern", "Saarland",
                                "Berlin", "Brandenburg", "Mecklenburg-Vorpommern", "Sachsen", "Sachsen-Anhalt",
                                "Thüringen"),
                   breaks = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15" ,"16"),
                   name = "Bundesländer") + 
   scale_x_date(date_breaks = "1 month", date_labels = "%b %y")+
   theme(axis.text.x = element_text(size = 18, angle = 45, vjust = 1, hjust = 1, face = "bold")) +
   theme(axis.text.y = element_text(size = 18, face = "bold")) +
   theme(text = element_text(size = 30))
