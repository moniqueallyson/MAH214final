source("R/moving-average.R")

library(tidyverse)

bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")

bq1_data <- moving_average(bq1)
bq2_data <- moving_average(bq2)
bq3_data <- moving_average(bq3)
prm_data <- moving_average(prm)

combined <- bind_rows(bq1_data, bq2_data, bq3_data, prm_data) # bind_rows vs rbind

glimpse(combined)

# clean_combine <- combined |>
#   # select(window_start, site, NH4N_ugl, NO3N_ugl, ca_mgl, mg_mgl, k_mgl) |>
# filter(window_start >= ymd("1988-01-05") & window_start <= ymd("1994-12-31"))

#clean combine long
clean_combine_long <- combined |>
  pivot_longer(
    cols = k_mgl:NO3N_ugl, # columns are not window start
    names_to = "ion", # names are ions
    values_to = "concentration" # these are the values
  )
print(clean_combine_long)


ggplot(
  data = clean_combine_long,
  mapping = aes(
    x = Sample_Date,
    y = concentration,
    color = site
  )
) +
  geom_point() +
  geom_line() +
  facet_wrap(~ion, ncol = 1, scales = "free") +
  theme_bw() +
  theme(
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank() # remove minor grid lines
  )
