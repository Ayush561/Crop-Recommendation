# Load libraries
library(tidyverse)
library(randomForest)

# Load dataset
data <- read_csv(file.choose())

# Convert label to factor
data$label <- as.factor(data$label)

# Train Random Forest model
set.seed(123)
rf_model <- randomForest(label ~ N + P + K + temperature + humidity + ph + rainfall,
                         data=data, ntree=500)

# Save model as RDS
saveRDS(rf_model, "crop_rf_model.rds")

print("Model trained and saved successfully.")
