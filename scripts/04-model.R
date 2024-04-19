#### Preamble ####
# Purpose: Models for video game sales analysis
# Author: Yingxuan Sun
# Date: today 
# Contact: lindayx.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)


#### Read data ####
yearly_sales <- read_parquet("data/analysis_data/yearly_sales_data.parquet")

### Model data ####
# Fitting the model
model <- stan_glm(Total_Global_Sales ~ Year_of_Release, data = yearly_sales,
                  family = gaussian(),
                  prior = normal(50, 20), prior_intercept = normal(-0.3, 0.1),
                  prior_aux = exponential(1, autoscale = FALSE),
                  iter = 4000, warmup = 2000, chains = 4)


#### Save model ####
saveRDS(
  model,
  file = "models/first_model.rds"
)


