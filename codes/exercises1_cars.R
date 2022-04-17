library(tidyverse)
library(readxl)

korean_cars <- read_csv("datasets/한국자동차_연비.csv",
                        locale=locale(encoding="CP949")) %>% 
  mutate(복합연비=as.numeric(substr(복합연비, 1, 4))) %>% 
  filter(!is.na(복합연비)) %>% 
  rename(CO2배출량=`배출량(CO2)`)

library(writexl)
write_xlsx(korean_cars, "datasets/korean_cars.xlsx")

korean_cars
