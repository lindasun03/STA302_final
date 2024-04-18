#### Preamble ####
# Purpose: Tests for cleaned analysis data
# Author: Yingxuan Sun
# Date: today
# Contact: lindayx.sun@mail.utoronto.ca 
# License: MIT

#### Workspace setup ####

library(dplyr)
library(arrow)

# Read the data from a Parquet file
data <- read_parquet("data/analysis_data/analysis_data.parquet")

# 1. Check for N/A values in the data
na_check <- any(is.na(data))

# 2. Verify if Global_Sales is equal to the sum of sales from NA, EU, JP, and Other regions
sales_check <- all(abs(data$Global_Sales - (data$NA_Sales + data$EU_Sales + data$JP_Sales + data$Other_Sales)) <= 0.1)

# 3. Check if all years are integers between 1980 and 2020
year_check <- all(data$Year_of_Release >= 1980 & data$Year_of_Release <= 2020 )

# Combine the checks into a list and print them
results <- list(na_check = na_check, sales_check = sales_check, year_check = year_check)
print(results)


