# anfaengerpraktikum
grthnjfdjztm
data1<-readRDS("/Users/fuxiao/Desktop/Anfängerpraktikum/data_lgl1 (1).rds")
data1_muenchen<-subset(data1,MeldeLandkreis=="SK München")
View(data1_muenchen)

##data1 EM
data1_EM<-subset(data1,Meldedatum>="2021-05-11"&Meldedatum<="2021-09-11")
View(data1_EM)

##data1 Muenchen EM
data1_muenchen_EM<-subset(data1_muenchen,Meldedatum>="2021-05-11"&Meldedatum<="2021-09-11")
View(data1_muenchen_EM)

##data1 Aggregation nach Meldedatum
#Bayern
data1_aggregate<-aggregate(data1$Hospitalisierung,data1[1],sum)
View(data1_aggregate)
data1_aggregate_EM<-subset(data1_aggregate,Meldedatum>="2021-05-11"&Meldedatum<="2021-09-11")
View(data1_aggregate_EM)
#Muenchen
data1_aggregate_muenchen<-aggregate(data1_muenchen$Hospitalisierung,data1_muenchen[1],sum)
View(data1_aggregate_muenchen)
data1_aggregate_muenchen_EM<-subset(data1_aggregate_muenchen,Meldedatum>="2021-05-11"&Meldedatum<="2021-09-11")
View(data1_aggregate_muenchen_EM)

##relative Haeufigkeit der Hospitalisierung Muenchen zu Bayern(hier problem wegen der fehlenden Werte)
relative_haeufigkeit_hospitalisierung_München_EM<-data1_aggregate_muenchen_EM$x/data1_aggregate_EM$x

##data1 Muenchen Altersgruppe(17,59]
data1_muenchen_17_59<-subset(data1_muenchen,Altersgruppe=="(17,59]")
View(data1_muenchen_17_59)
data1_muenchen_EM_17_59<-subset(data1_muenchen_EM,Altersgruppe=="(17,59]")
View(data1_muenchen_EM_17_59)

##data1 Altersgruppe(59,Inf]
data1_muenchen_59_Inf<-subset(data1_muenchen,Altersgruppe=="(59, Inf]")
View(data1_muenchen_59_Inf)
data1_muenchen_EM_59_lnf<-subset(data1_muenchen_EM,Altersgruppe=="(59, Inf]")
View(data1_muenchen_EM_59_lnf)

##data1 Altersgruppe(-Inf,17]
data1_muenchen_Inf_17<-subset(data1_muenchen,Altersgruppe=="(-Inf,17]")
View(data1_muenchen_Inf_17)
data1_muenchen_EM_Inf_17<-subset(data1_muenchen_EM,Altersgruppe=="(-Inf,17]")
View(data1_muenchen_EM_-Inf_17)
