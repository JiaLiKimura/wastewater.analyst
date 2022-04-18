library(utils)
library(devtools)
library(usethis)
cohzip<-read.table("data-raw/cohzip.txt")
cohzip<-cohzip[[1]]
usethis::use_data(cohzip, overwrite = TRUE)
