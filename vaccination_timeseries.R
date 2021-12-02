## Impfstoff Data

vaccination_timeseries <- read.table(file='germany_vaccinations_timeseries_v2.tsv')


## Spaltennamen Änderung
colnames(vaccination_timeseries) <- as.character(vaccination_timeseries[1,])
vaccination_timeseries <- vaccination_timeseries[-1, ]
