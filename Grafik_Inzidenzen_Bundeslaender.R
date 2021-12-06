
 ggplot(data =test34, aes(x = ergebniss3, y = ergebniss1, group = ergebniss2)) +
       geom_line(alpha = 0.5) +
       scale_x_date(date_breaks = "4 week", date_labels = "%b %d") +
   geom_line(data = new, aes( x = ergebniss3, y = ergebniss1, colour = "red"), size = 1.5) +
   geom_line(data = new, aes(x = ergebniss3, y = germany, colour = "blue"), size = 1.5)
   
   
