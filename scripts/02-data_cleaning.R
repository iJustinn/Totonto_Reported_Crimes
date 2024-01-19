#### Preamble ####
# Purpose: Cleans the raw reported crimes data by changing names and selecting relevant columns for further analysis
# Author: Ziheng Zhong
# Date: 18 January 2024
# Contact: ziheng.zhong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/plane_data.csv")

cleaned_data <-
  raw_data |>


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
