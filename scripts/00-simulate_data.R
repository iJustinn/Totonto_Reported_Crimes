#### Preamble ####
# Purpose: 
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



#### Simulate data ####
# Set parameters for simulation
crime_rate <- 0.02915
population <- 100000  # Example population, adjust as needed
start_year <- 2014
end_year <- 2022

# Create and simulate total cases for each year
simulated_data <- data.frame(report_year = start_year:end_year) |>
  mutate(total_cases = round(population * crime_rate))

# View the simulated data
print(simulated_data)


