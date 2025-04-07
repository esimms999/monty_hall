# Set seed for reproducibility
set.seed(123)

# Number of runs, simulations and doors
n_runs <- 10
n_simulations <- 100
n_doors <- 3

# Function to simulate one Monty Hall game with n doors
monty_hall <- function(n_doors) {
  doors <- c(1, rep(0, n_doors - 1))
  doors <- sample(doors)

  player_choice <- sample(1:n_doors, 1)

  all_doors <- 1:n_doors
  goat_doors <- which(doors == 0)
  monty_options <- setdiff(goat_doors, player_choice)

  if (length(monty_options) < 1) {
    stop("Error: No goat doors available for Monty to open.")
  }

  # Monty opens all goats if player picked a goat, or all but one if player picked car
  if (doors[player_choice] == 0) {
    # Player picked a goat: open all other goats
    monty_opens <- monty_options
  } else {
    # Player picked the car: open all but one goat
    n_to_open <- length(monty_options) - 1
    monty_opens <- if (n_to_open > 0) monty_options[1:n_to_open] else integer(0)
  }

  remaining_doors <- setdiff(all_doors, c(player_choice, monty_opens))

  # Ensure exactly one remaining door
  if (length(remaining_doors) != 1) {
    stop("Error: Incorrect number of remaining doors: ", length(remaining_doors))
  }
  remaining_door <- remaining_doors

  # Return named vector
  outcomes <- c(stick = doors[player_choice], switch = doors[remaining_door])
  names(outcomes) <- c("stick", "switch")
  return(outcomes)
}

# Run simulation n_sim times
for (run in 1:n_runs) {
  set.seed(123 + run - 1) # Vary seed each run
  tryCatch(
    {
      results <- matrix(nrow = n_simulations, ncol = 2)
      for (i in 1:n_simulations) {
        results[i, ] <- monty_hall(n_doors)
      }
      colnames(results) <- c("stick", "switch")

      stick_results <- results[, "stick"]
      switch_results <- results[, "switch"]

      stick_win_rate <- mean(stick_results)
      switch_win_rate <- mean(switch_results)

      cat("Run", run, ":\n")
      cat("Number of doors:", n_doors, "\n")
      cat("Win rate for sticking:", stick_win_rate, "\n")
      cat("Win rate for switching:", switch_win_rate, "\n")
      cat("Total win rate (should be 1.0):", stick_win_rate + switch_win_rate, "\n\n")
    },
    error = function(e) {
      cat("Error in run", run, ":", e$message, "\n\n")
    }
  )
}
