#### Preamble ####
# Purpose: Downloads, saves, and reads data from OpenToronto OpenData portal
# Author: Ziheng Zhong
# Date: 18 January 2024
# Contact: ziheng.zhong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)


#### Download data ####
raw_data <- list_package_resources("police-annual-statistical-report-reported-crimes") |>
  head(1) |>
  get_resource()


#### Save data ####
write_csv(
  x = raw_data,
  file = "inputs/data/raw_data.csv"
)


