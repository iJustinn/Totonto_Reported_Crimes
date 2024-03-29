#### Preamble ####
# Purpose: Generate clear charts to visually display the data we have.
# Author: Ziheng Zhong
# Date: 18 January 2024
# Contact: ziheng.zhong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
# setup all libraries
library(opendatatoronto)
library(tidyverse)
library(ggplot2)
library(janitor)
library(dplyr)
library(readr)



#### Visualize data ####
# read the sum_by_year_data, ready for generating bar chart
sum_by_year_data <- read_csv("outputs/data/sum_by_year_data.csv")

# create the bar chart with y-axis showing total cases in the year and x-axis showing the year number
ggplot(sum_by_year_data, aes(x = report_year, y = total_cases)) +
  scale_x_continuous(breaks = sum_by_year_data$report_year) +
  geom_bar(stat = "identity", fill = "darkgrey") +
  theme_minimal() +
  labs(title = "2014 to 2022 Toronto Total Reported Crime Cases by Year",
       x = "Report Year",
       y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# read the sum_by_year_data, ready for generating bar chart
sum_by_division_data <- read_csv("outputs/data/sum_by_division_data.csv")

# create the bar chart with y-axis showing total cases in the division and x-axis showing the division number
ggplot(sum_by_division_data, aes(x = division, y = total_cases, fill = division)) +
  #geom_bar(stat = "identity", position = position_dodge()) +
  geom_bar(stat = "identity", fill = "darkgrey") +
  theme_minimal() +
  labs(title = "2014 to 2022 Toronto Total Reported Crime Cases by Division",
       x = "Division",
       y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


