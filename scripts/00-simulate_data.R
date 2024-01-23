#### Preamble ####
# Purpose: Simulate the reported crime data, and try to see what the data and charts may look like, before getting into the actual data set.
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



#### Simulate data ####
# set a random seed for dataset
set.seed(666)

# define the number of years to investigate
years <- 2002:2023

# create division codes D01, D02, ..., D10
divisions <- paste0("D", sprintf("%02d", 1:20))

# create a data frame to simulate the total cases for each division and year
simulated_data <- expand.grid(Reported_Year = years, Division = divisions)

# use poisson distribution to generate the count data
simulated_data$Total_Cases <- rpois(nrow(simulated_data), lambda = 100)

# view the first few rows of the simulated data
head(simulated_data)



#### Process data ####
# summarize simulated data by year
sum_by_year_simulated <- simulated_data |>
  group_by(Reported_Year) |>
  summarise(Total_Cases = sum(Total_Cases))

# summarize simulated data by division
sum_by_division_simulated <- simulated_data |>
  group_by(Division) |>
  summarise(Total_Cases = sum(Total_Cases))



#### Visualize data ####
# visualize the summarized data by year
ggplot(sum_by_year_simulated, aes(x = Reported_Year, y = Total_Cases)) +
  geom_bar(stat = "identity", fill = "darkgrey") +
  scale_x_continuous(breaks = seq(min(sum_by_year_simulated$Reported_Year), max(sum_by_year_simulated$Reported_Year), by = 1)) +
  theme_minimal() +
  labs(x = "Reported Year", y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# visualize the summarized data by division
ggplot(sum_by_division_simulated, aes(x = Division, y = Total_Cases, fill = Division)) +
  geom_bar(stat = "identity", fill = "darkgrey") +
  theme_minimal() +
  labs(x = "Division", y = "Total Cases") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))



#### Save data ####
# save the simulated data to a csv file
write_csv(
  x = simulated_data,
  file = "inputs/data/simulated_data.csv"
)

# save the simulated data to a csv file
write_csv(
  x = sum_by_year_simulated,
  file = "outputs/data/sum_by_year_simulated.csv"
)

# save the simulated data to a csv file
write_csv(
  x = sum_by_division_simulated,
  file = "outputs/data/sum_by_division_simulated.csv"
)


