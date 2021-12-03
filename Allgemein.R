#Allgemein


## Impfstoff Data

vaccination_timeseries <- read.table(file='germany_vaccinations_timeseries_v2.tsv')

## Spaltennamen Änderung
colnames(vaccination_timeseries) <- as.character(vaccination_timeseries[1,])
vaccination_timeseries <- vaccination_timeseries[-1, ]

## Formatierung Date
myformat2<-"%Y-%m-%d"
vaccination_timeseries$date<-as.Date(vaccination_timeseries$date,myformat2)
View(vaccination_timeseries)



## RKI Datensatz Bayern

install.packages("vroom")
library(vroom)

rki_bayern_data <- vroom('RKI_COVID19_Bayern.zip')
