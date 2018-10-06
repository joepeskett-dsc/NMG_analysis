#Analysing the NMG survey
library(readxl)
library(dplyr)
setwd("NMG_analysis/")
rm(list = ls())
download.file(url = "https://www.bankofengland.co.uk/-/media/boe/files/statistics/research-datasets/boe-nmg-household-survey-data---2011-17.xlsx?la=en&hash=DB481E590DCFBCC508BC093291721EF5720CB7BE",
              destfile = "data/NMG.xlsx", mode = "wb")
data_desc <- read_xlsx(path = "NMG.xlsx", sheet = 1)
data_dict <- read_xlsx(path = "NMG.xlsx", sheet = 2)
NMG_2017 <- read_xlsx(path = "NMG.xlsx", sheet = 3)
NMG_2016 <- read_xlsx(path = "NMG.xlsx", sheet = 4)
NMG_2015 <- read_xlsx(path = "NMG.xlsx", sheet = 5)
NMG_2014 <- read_xlsx(path = "NMG.xlsx", sheet = 6)
NMG_2013 <- read_xlsx(path = "NMG.xlsx", sheet = 7)
NMG_2012 <- read_xlsx(path = "NMG.xlsx", sheet = 8)
NMG_2011 <- read_xlsx(path = "NMG.xlsx", sheet = 9)

if (!dir.exists("data")){
  dir.create("data")
}
lapply(X = ls(), 
       FUN = function(x) write.csv(eval(as.symbol(x)), 
                                   file = paste0("data/", x, ".csv")))
