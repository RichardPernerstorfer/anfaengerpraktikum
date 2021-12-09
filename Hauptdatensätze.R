divi_17_11 <- read_csv("DIVI-Intensivregister_2021-11-17_12-15.csv")
X2021_11_02_new_icu_fed_adj <- read_csv("2021-11-02_new_icu_fed_adj.csv")
Aktuell_Deutschland_COVID_19_Hospitalisierungen <- read_csv("Aktuell_Deutschland_COVID-19-Hospitalisierungen.csv")
`data_lgl1 (1)` <- readRDS("~/R/anfaengerpraktikum09/data_lgl1 (1).rds")
RKI_Infektionen <- RKI_Infektionen <- readRDS("RKI_Infektionen")
Klinische_Aspekte <- read_excel("Klinische_Aspekte.xlsx")
RKI_COVID19 <- read_csv("RKI_COVID19.csv")
RKI_COVID19$Meldedatum <- as.Date(RKI_COVID19$Meldedatum)




