#Allgemein


## Impfstoff Data

vaccination_timeseries <- read.table(file='germany_vaccinations_timeseries_v2.tsv')

## Spaltennamen Änderung
colnames(vaccination_timeseries) <- as.character(vaccination_timeseries[1,])
vaccination_timeseries <- vaccination_timeseries[-1, ]



## RKI Datensatz Bayern

install.packages("vroom")
library(vroom)

rki_bayern_data <- vroom('RKI_COVID19_Bayern.zip')
