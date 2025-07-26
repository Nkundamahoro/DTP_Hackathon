# Load necessary packages
library(readxl)    # for reading Excel files
library(dplyr)     # for data manipulation

library(readxl)
Flooddd <- read_excel("C:/Users/USER/OneDrive/Desktop/Flooddd.xlsx")
Flooddd
file_path <- Flooddd
file_path
# Create binary target variable
# Create binary target variable
# Summary statistics for all variables
summary(file_path)

# Load visualization library
library(ggplot2)

# Example: histogram of MonsoonIntensity
ggplot(file_path, aes(x = MonsoonIntensity)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Monsoon Intensity", x = "Monsoon Intensity", y = "Count")

# Correlation matrix
cor_matrix <- cor(file_path)
print(round(cor_matrix, 2))

# Optional: visualize correlation heatmap
library(corrplot)
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.7)

file_path <- file_path %>%
mutate(Flood = ifelse(MonsoonIntensity >= 6, 1, 0))
file_path
summary(file_path)
num_cols <- names(select(file_path, -Flood))
file_path <- file_path %>%
  mutate(across(all_of(num_cols), scale))

# View scaled data (optional)
file_path




