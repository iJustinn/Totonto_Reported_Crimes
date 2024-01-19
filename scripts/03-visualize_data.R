#### Preamble ####
# Purpose: Generate clear charts to visually display the content of data we have
# Author: Ziheng Zhong
# Date: 18 January 2024
# Contact: ziheng.zhong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(ggplot2)
library(janitor)
library(dplyr)
library(readr)



#### Visualize data ####
# read in the sum_by_year_data to work on
sum_by_year_data <- read_csv("outputs/data/sum_by_year_data.csv")

# create the bar chart for total cases by year
ggplot(sum_by_year_data, aes(x = report_year, y = total_cases)) +
  scale_x_continuous(breaks = sum_by_year_data$report_year) +
  geom_bar(stat = "identity", fill = "darkgrey") +
  theme_minimal() +
  labs(title = "Total Reported Crime Cases by Year",
       x = "Report Year",
       y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# read the summarized data by division
sum_by_division_data <- read_csv("outputs/data/sum_by_division_data.csv")

# create the bar chart for 2014
ggplot(sum_by_division_data, aes(x = division, y = total_cases, fill = division)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  labs(title = "Total Reported Crime Cases by Division in 2014",
       x = "Division",
       y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


