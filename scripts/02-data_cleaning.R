#### Preamble ####
# Purpose: Cleans the raw reported crimes data by changing names and selecting relevant columns for further analysis
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



#### Clean data ####
# read the raw_data, ready for cleaning
raw_data <- read_csv("inputs/data/raw_data.csv")

# clean the names of columns
cleaned_data <-
  clean_names(raw_data)

# select columns we actually need
cleaned_data <-
  cleaned_data |>
  select(
    report_year,
    division,
    count
  )

# rename some columns for better readability
cleaned_data <-
  cleaned_data |>
  rename(
    total_case = count
  )



#### Save data ####
write_csv(
  x = cleaned_data,
  file = "outputs/data/cleaned_data.csv"
)



#### Summarize data ####
# read the cleaned_data
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

# summarize data by year, for easier work when visualizing
sum_by_year_data <- cleaned_data |>
  group_by(report_year) |>
  summarise(total_cases = sum(total_case))

# summarize data by division, for easier work when visualizing
sum_by_division_data <- cleaned_data |>
  group_by(division) |>
  summarise(total_cases = sum(total_case))



#### Save data ####
write_csv(
  x = sum_by_year_data,
  file = "outputs/data/sum_by_year_data.csv"
)

write_csv(
  x = sum_by_division_data,
  file = "outputs/data/sum_by_division_data.csv"
)


