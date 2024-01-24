#### Preamble ####
# Purpose: Search for, download, and save the necessary data from the Open Toronto OpenData portal.
# Author: Ziheng Zhong
# Date: 18 January 2024
# Contact: ziheng.zhong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
# setup all libraries
library(opendatatoronto)
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)



#### Download data ####
# search for data from Open Data Toronto by specify the belonged package and select the csv type to download
raw_data <- list_package_resources("police-annual-statistical-report-reported-crimes") |>
  head(1) |>
  get_resource()



#### Save data ####
# save the downloaded data to a csv file, wait for cleaning
write_csv(
  x = raw_data,
  file = "inputs/data/raw_data.csv"
)


