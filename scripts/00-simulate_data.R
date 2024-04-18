#### Preamble ####
# Purpose: Simulates an analysis dataset about Pokemon level and weakness against fire
# Author: Rohan Alexander
# Date: 26 March 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -


#### Workspace setup ####
library(arrow)
library(dplyr)

#### Simulate data ####

set.seed(123)

data <- tibble(
  Platform = sample(c("PS2", "DS", "PS3", "Wii", "X360", "PSP", "PS", "PC", "XB", "GBA", "Others"), 200, replace = TRUE),
  Year_of_Release = sample(1985:2020, 200, replace = TRUE),
  Publisher = sample(c("Electronic Arts", "Activision", "Namco Bandai Games", "Ubisoft", "Konami Digital Entertainment",
                       "THQ", "Nintendo", "Sony Computer Entertainment", "Sega", "Take-Two Interactive"), 200, replace = TRUE),
  NA_Sales = round(runif(200, 0, 45), 2),
  EU_Sales = round(runif(200, 0, 30), 2),
  JP_Sales = round(runif(200, 0, 15), 2),
  Other_Sales = round(runif(200, 0, 15), 2)
)

# calculate global sales
data <- data %>%
  mutate(Global_Sales = NA_Sales + EU_Sales + JP_Sales + Other_Sales)

# save as Parquet file
write_parquet(data, "data/analysis_data/simulated_data.parquet")










