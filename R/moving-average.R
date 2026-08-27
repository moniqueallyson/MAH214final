moving_average <- function(water) {
  water <- water |>
    select(Sample_Date, Sample_ID, `NH4-N`, `NO3-N`, Ca, Mg, K) |>
    filter(
      Sample_Date >= ymd("1988-01-05") & Sample_Date <= ymd("1994-12-31")
    )
  result <- tibble(
    Sample_Date = seq(
      ymd(water$Sample_Date[1]),
      ymd(water$Sample_Date[nrow(water)]),
      by = "63 days"
    ),
    site = water$Sample_ID[1],
    k_mgl = NA,
    mg_mgl = NA,
    ca_mgl = NA,
    NH4N_ugl = NA,
    NO3N_ugl = NA,
  )

  for (i in 1:nrow(result)) {
    w1 <- result$Sample_Date[i]
    w2 <- w1 + 63

    in_window <- water$Sample_Date >= w1 & water$Sample_Date < w2

    k_window <- water$K[in_window]
    nh4_window <- water$`NH4-N`[in_window]
    no3_window <- water$`NO3-N`[in_window]
    ca_window <- water$Ca[in_window]
    mg_window <- water$Mg[in_window]

    result$k_mgl[i] <- mean(k_window, na.rm = TRUE)
    result$NH4N_ugl[i] <- mean(nh4_window, na.rm = TRUE)
    result$NO3N_ugl[i] <- mean(no3_window, na.rm = TRUE)
    result$ca_mgl[i] <- mean(ca_window, na.rm = TRUE)
    result$mg_mgl[i] <- mean(mg_window, na.rm = TRUE)
  }
  return(result)
}
