# Set seed for reproducibility
set.seed(123)

# Number of simulations
n_simulations <- 1000000

# Function to simulate one Monty Hall game and return both outcomes
monty_hall <- function() {
  # Three doors: 1 = car, 0 = goat
  doors <- c(1, 0, 0)
  doors <- sample(doors)  # Randomly place the car

  # Player picks a door
  player_choice <- sample(1:3, 1)

  # Monty opens a goat door, not the player's choice
  all_doors <- 1:3
  goat_doors <- which(doors == 0)
  monty_options <- setdiff(goat_doors, player_choice)

  # Monty picks one goat door
  monty_opens <- monty_options[sample(length(monty_options), 1)]

  # Remaining door
  remaining_door <- setdiff(all_doors, c(player_choice, monty_opens))

  # Return outcomes for both strategies
  c(stick = doors[player_choice], switch = doors[remaining_door])
}

# Simulate games and store results
results <- t(replicate(n_simulations, monty_hall()))
stick_results <- results[, "stick"]
switch_results <- results[, "switch"]

# Calculate win rates
stick_win_rate <- mean(stick_results)
switch_win_rate <- mean(switch_results)

# Print results
cat("Win rate for sticking:", stick_win_rate, "\n")
cat("Win rate for switching:", switch_win_rate, "\n")

# Check total
cat("Total win rate (should be 1.0):", stick_win_rate + switch_win_rate, "\n")

# Plot results
barplot(c(stick_win_rate, switch_win_rate),
        names.arg = c("Stick", "Switch"),
        ylim = c(0, 1),
        main = "Monty Hall Problem Simulation",
        ylab = "Win Rate",
        col = c("red", "blue"))

