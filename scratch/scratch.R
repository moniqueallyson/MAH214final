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


clean_combine <- combined |>
  select(Sample_Date, `NH4-N`, `NO3-N`, Ca, Mg, K)


glimpse(clean_combine)

ggplot(
  data = clean_combine,
  mapping = aes(
    x = Sample_Date,
    y = `NH4-N`
  )
) +
  geom_line() +
  geom_point()


combine_tibble <- tibble(
  window_start = seq(
    ymd("1984-05-20"),
    ymd("1994-12-31"),
    by = "63 days"
  ),
  site = NA,
  NH4N_ugl = NA,
  NO3N_ugl = NA,
  Ca_mgl = NA,
  Mg_mgl = NA,
  K_mgl = NA
)


w2 <- clean_combine$Sample_Date[1]
for (i in 1:nrow(combine_tibble)) {
  w1 <- w2
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)
  print('')
  k <- clean_combine$K[
    clean_combine$Sample_Date >= w1 & clean_combine$Sample_Date < w2
  ]
  mean_k <- mean(k, na.rm = TRUE)
  combine_tibble$K_mgl[i] <- mean_k
  mg <- clean_combine$Mg[
    clean_combine$Sample_Date >= w1 & clean_combine$Sample_Date < w2
  ]
  mean_mg <- mean(mg, na.rm = TRUE)
  combine_tibble$Mg_mgl[i] <- mean_mg
  nh4n <- clean_combine$`NH4-N`[
    clean_combine$Sample_Date >= w1 & clean_combine$Sample_Date < w2
  ]
  mean_nh4n <- mean(nh4n, na.rm = TRUE)
  combine_tibble$NH4N_ugl[i] <- mean_nh4n
  ca <- clean_combine$Ca[
    clean_combine$Sample_Date >= w1 & clean_combine$Sample_Date < w2
  ]
  mean_ca <- mean(ca, na.rm = TRUE)
  combine_tibble$Ca_mgl <- mean_ca
  no3n <- clean_combine$`NO3-N`[
    clean_combine$Sample_Date >= w1 & clean_combine$Sample_Date < w2
  ]
  mean_no3n <- mean(no3n, na.rm = TRUE)
  combine_tibble$NO3N_ugl <- mean_no3n
}
print(combine_tibble) # does not show site per value

# my attempt to get the site from sample id
combine_tibble$site <- clean_combine$Sample_ID

clean_site <- clean_combine$Sample_ID

site <- clean_combine$Sample_ID
combine_tibble$site <- filter(clean_combine$Sample_Date)


#clean combine long
clean_combine_long <- combine_tibble |>
  pivot_longer(
    cols = !window_start & !site, # columns are not window start
    names_to = "ion", # names are ions
    values_to = "concentration" # these are the values
  )
print(clean_combine_long)


# plot with facet wrap
ggplot(
  data = clean_combine_long,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = ion
  )
) +
  geom_point() +
  geom_line() +
  scale_color_viridis(discrete = TRUE)
facet_wrap(~ion, scales = "free") +
  theme_bw() +
  theme(
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank() # remove minor grid lines
  )
