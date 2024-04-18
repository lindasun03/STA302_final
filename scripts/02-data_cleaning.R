#### Preamble ####
# Purpose: Cleans the raw data downloaded from Kaggle
# Author: Yingxuan Sun
# Date: today 
# Contact: lindayx.sunr@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(dplyr)
library(arrow)
library(tidyverse)

#### Clean data ####
data <- read.csv("data/raw_data/raw_data.csv")

# Remove columns whose data is not used in this analysis
data <- data[,(2:10)]

# Replace platforms not in top10 publishing amount with "others"
specified_platforms <- c("PS2", "DS", "PS3", "Wii", 
                          "X360", "PSP", "PS", "PC", 
                          "XB", "GBA")
data$Platform <- ifelse(data$Platform %in% specified_platforms, data$Platform, "Other")

# Replace publishers not in top10 publishing amount with "others"
specified_publishers <- c("Electronic Arts", "Activision", "Namco Bandai Games", "Ubisoft", 
                          "Konami Digital Entertainment", "THQ", "Nintendo", "Sony Computer Entertainment", 
                          "Sega", "Take-Two Interactive")
data$Publisher <- ifelse(data$Publisher %in% specified_publishers, data$Publisher, "Other")

# Remove rows with "N/A" values
data <- data %>%
  filter_all(all_vars(!is.na(.)))

#### Save data ####
write_parquet(data, "data/analysis_data/analysis_data.parquet")

write_csv(data, "data/analysis_data/analysis_data.csv")



