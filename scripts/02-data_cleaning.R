#### Preamble ####
# Purpose: Clean the raw 'Reported Crimes' data by renaming and selecting relevant columns. Then, further analyze the cleaned data to optimize it for the specific charts needed in the next step.
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



#### Clean data ####
# read the data from raw_data.csv to a parameter, make it ready for cleaning
raw_data <- read_csv("inputs/data/raw_data.csv")

# clean the names for each columns by clean_names method
cleaned_data <-
  clean_names(raw_data)

# select columns that we need by select() method
cleaned_data <-
  cleaned_data |>
  select(
    report_year,
    division,
    count
  )

# rename some columns for better readability by rename() method
cleaned_data <-
  cleaned_data |>
  rename(
    total_case = count
  )



#### Save data ####
# save the cleaned data to a csv file
write_csv(
  x = cleaned_data,
  file = "outputs/data/cleaned_data.csv"
)



#### Summarize data ####
# read the cleaned_data for further analysis
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

# summarize data by year, sum up all reported cases in specific year, for easier work when visualizing
sum_by_year_data <- cleaned_data |>
  group_by(report_year) |>
  summarise(total_cases = sum(total_case))

# summarize data by division, sum up all reported cases in specific division, for easier work when visualizing
sum_by_division_data <- cleaned_data |>
  group_by(division) |>
  summarise(total_cases = sum(total_case))



#### Save data ####
# save the analyzed data to separate csv files
write_csv(
  x = sum_by_year_data,
  file = "outputs/data/sum_by_year_data.csv"
)

write_csv(
  x = sum_by_division_data,
  file = "outputs/data/sum_by_division_data.csv"
)


