# reading in the data
source("R/moving-average.R")
library(tidyverse)

bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")


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
    cols = k_mgl:NO3N_ugl, # using a sequence by column to get the values
    names_to = "ion", # renaming the column using the chemical names this helps to group them all together
    values_to = "concentration" # the columns need values from the ion concentration levels
  )
print(clean_combine_long)

write_csv(clean_combine_long, "output/clean_data.csv") # make the csv file and have it under output
