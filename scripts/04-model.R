#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)


#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

### Model data ####
# Fitting the model
model <- stan_glm(Global_Sales ~ Year_of_Release, data = analysis_data,
                  family = gaussian(),
                  prior = normal(50, 20), prior_intercept = normal(-0.3, 0.1),
                  prior_aux = exponential(1, autoscale = FALSE),
                  iter = 4000, warmup = 2000, chains = 4)


#### Save model ####
saveRDS(
  model,
  file = "models/first_model.rds"
)


