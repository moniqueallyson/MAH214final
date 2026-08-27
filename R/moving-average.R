moving_average <- function(water) {
  water |>
    filter()
  result <- tibble(
    window_start = seq(
      ymd(water$Sample_Date[1]),
      ymd(water$Sample_Date[nrow(water)]),
      by = "63 days"
    ),
    site = water$Sample_ID,
    k_mgl = NA,
    mg_mgl = NA,
    Ca_mgl = NA,
    NH4N_ugl = NA,
    NO3N_ugl = NA,
  )

  # Fill in the iterator and sequence
  for (i in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- clean_combine$Sample_Date[i]
    w2 <- w1 + weeks(9)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- water$Sample_Date >= w1 & water$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    k_window <- water$K[in_window]
    nh4_window <- water$`NH4-N`[in_window]
    no3_window <- water$`NO3-N`[in_window]
    ca_window <- water$Ca[in_window]
    mg_window <- water$Mg[in_window]

    # The line above gets potassium in the window. Get the rest of the ions too

    # Calculate the mean of each ion concentration and fill in the result
    result$k_mgl[water] <- mean(K, na.rm = TRUE)
    result$NH4N_ugl[water] <- mean(`NH4-N`, na.rm = TRUE)
    result$NO3N_ugl[water] <- mean(`NO3-N`, na.rm = TRUE)
    result$Ca_mgl[water] <- mean(Ca, na.rm = TRUE)
    result$Mg_mgl[water] <- mean(Mg, na.rm = TRUE)
  }
  return(result)
  # Return the result
}
