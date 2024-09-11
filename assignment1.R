#Part 1
# Load the necessary library and data
library(datasets)
data(mtcars)

# Add car names to the dataset
mtcars$car_name <- rownames(mtcars)

# Subset the data
selected_cars <- subset(mtcars, car_name %in% c("Merc 450SL", "Fiat 128", "Ferrari Dino"))

# Add a FuelEfficiency column
selected_cars$FuelEfficiency <- ifelse(selected_cars$mpg >= 21, "good", "bad")

# Calculate PowerRating as the ratio of horsepower (hp) to displacement (disp)
selected_cars$PowerRating <- selected_cars$hp / selected_cars$disp

# Rank the cars by PowerRating in descending order
selected_cars <- selected_cars[order(selected_cars$PowerRating, decreasing = TRUE),]

# Create a simplified dataset with only mpg, FuelEfficiency, and PowerRating
simplified_cars <- selected_cars[, c("mpg", "FuelEfficiency", "PowerRating")]

# Display the simplified car data
print(simplified_cars)


# Part 2: Car name comparison based on string length
car_names <- c("Ferrari Dino", "Fiat 128", "Merc 450SL")

name_lengths <- nchar(car_names)

# 3x3 matrix to store comparison results
comparison_matrix <- matrix(nrow = 3, ncol = 3)

# Compare the lengths of car names
for (i in 1:3) {
  for (j in 1:3) {
    if (name_lengths[i] > name_lengths[j]) {
      comparison_matrix[i, j] <- "Longer"
    } else if (name_lengths[i] < name_lengths[j]) {
      comparison_matrix[i, j] <- "Shorter"
    } else {
      comparison_matrix[i, j] <- "Same"
    }
  }
}

# Convert the matrix to a data frame and label rows and columns with car names
comparison_df <- as.data.frame(comparison_matrix)
rownames(comparison_df) <- car_names
colnames(comparison_df) <- car_names

# Display the comparison data frame
print(comparison_df)
