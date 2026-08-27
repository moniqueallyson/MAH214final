# I just took your code from your other
# reading in the data
source("R/moving-average.R")
library(tidyverse)

bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")


# clean and combine the data
bq1_data <- moving_average(bq1) # calling new data to input moving average for first site
bq2_data <- moving_average(bq2)
bq3_data <- moving_average(bq3)
prm_data <- moving_average(prm)

combined <- bind_rows(bq1_data, bq2_data, bq3_data, prm_data)
# rbind to combine the rows more eficient than bind_rows

# pivot it
clean_combine_long <- combined |> #
  pivot_longer(
    # collapse columns in order to plot by ions & their concentration levels
    cols = k_mgl:NO3N_ugl, # columns will NOT select with "!"
    names_to = "ion", # to have the ion listed
    values_to = "concentration" # for the columns need values from the ion concentrations
  )
print(clean_combine_long)
