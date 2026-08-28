moving_average <- function(water) {
  # moving average function makes it easier to call for each site's dataframe
  water <- water |> # water variable to call for the new data
    select(Sample_Date, Sample_ID, `NH4-N`, `NO3-N`, Ca, Mg, K) |> # selecting the columns needs based on the figure
    filter(
      Sample_Date >= ymd("1988-01-05") & Sample_Date <= ymd("1994-12-31") # refrencing the time period from original figure
    )
  result <- tibble(
    # tibble to input the values for the ions
    Sample_Date = seq(
      # list out the dates from a start and end point by a #
      ymd(water$Sample_Date[1]), # the first date in the water dataset
      ymd(water$Sample_Date[nrow(water)]), # use the column from the data set using the number of rows in water
      by = "63 days" # 9 week window = 63 days
    ),
    site = water$Sample_ID[1], # to receive the site for the respective ion value
    k_mgl <- NA, # ion concentration value placehholderfor Potassium left NA to get an input
    mg_mgl <- NA, # Magnesium
    ca_mgl <- NA, # Calcium
    NH4N_ugl <- NA, #  Nitrate
    NO3N_ugl <- NA, # Ammonium
  )

  for (i in 1:nrow(result)) {
    # loop using the number of rows to start the sequence 1:number
    w1 <- result$Sample_Date[i] # first window date from the result tibble using the column date
    w2 <- w1 + 63 # the next window date from the initial (w1) date

    in_window <- water$Sample_Date >= w1 & water$Sample_Date < w2 # window creation using the loop created above

    k_window <- water$K[in_window] # finding Potassium values found inside the window
    nh4_window <- water$`NH4-N`[in_window] # find Ammonium
    no3_window <- water$`NO3-N`[in_window] # find Nitrate
    ca_window <- water$Ca[in_window] # find Calcium
    mg_window <- water$Mg[in_window] # find Magnesium

    result$k_mgl[i] <- mean(k_window, na.rm = TRUE) # using mean function to find the mean and input into result tibble
    result$NH4N_ugl[i] <- mean(nh4_window, na.rm = TRUE)
    result$NO3N_ugl[i] <- mean(no3_window, na.rm = TRUE)
    result$ca_mgl[i] <- mean(ca_window, na.rm = TRUE)
    result$mg_mgl[i] <- mean(mg_window, na.rm = TRUE)
  }
  return(result)
}
