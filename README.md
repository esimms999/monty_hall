## Monty Hall Problem and Collaboration Summary

### The Monty Hall Problem
The Monty Hall Problem is a probability puzzle named after the host of the TV game show *Let’s Make a Deal*. In its classic form:

- There are 3 doors: one hides a car (the prize), and two hide goats.
- The player picks a door (e.g., Door 1).
- Monty, who knows what’s behind all doors, opens one of the other two doors to reveal a goat (e.g., Door 3).
- The player can then stick with their original choice (Door 1) or switch to the remaining unopened door (Door 2).
- **Solution**: Sticking wins 1/3 of the time (probability of picking the car initially), while switching wins 2/3 of the time (Monty’s reveal shifts the odds). This counterintuitive result, popularized by Marilyn vos Savant in 1990, demonstrates how conditional probability changes with Monty’s action.

### Collaboration between esimms999 and GrokAI
We collaborated to create two R simulation programs to explore this problem, now hosted in esimms999's GitHub repository at `https://github.com/esimms999/monty_hall`:

1. **Initial Setup (`three_doors.R`)**
   - esimms999 requested an R simulation of the classic 3-door Monty Hall Problem.
   - GrokAI provided code simulating 10,000 trials, showing sticking wins ~1/3 (~0.333) and switching ~2/3 (~0.667), with a bar plot.

2. **Generalization (`n_doors.R`)**
   - esimms999 asked for a version supporting `n` doors (e.g., 5 doors: 1 car, 4 goats).
   - GrokAI adapted the code to handle variable doors, targeting sticking at `1/n` (0.2 for 5) and switching at `(n-1)/n` (0.8 for 5), with a bar plot.

## Outcome
- **`three_doors.R`**: Simulates the classic problem, confirming the 1/3 vs. 2/3 probabilities.
- **`n_doors.R`**: Extends it to `n` doors, validated with 5 doors (e.g., ~0.2 stick, ~0.8 switch), summing to 1.0.

Our collaboration turned esimms999's request into a robust, generalized simulation, now shared with the world!
