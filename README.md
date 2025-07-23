# Crop-Recommendation
This project is an interactive Crop Recommendation System built using R Shiny, designed to help farmers and agricultural professionals determine the most suitable crop to cultivate based on soil and environmental conditions such as Nitrogen, Phosphorus, Potassium, Temperature, Humidity, pH, and Rainfall.

🔍 Overview
The application allows users to input soil and climate parameters and receive crop recommendations based on three machine learning models:

✅ K-Nearest Neighbors (KNN)

✅ Logistic Regression

✅ Decision Tree

Each model predicts the most suitable crop and displays its prediction accuracy.

🧠 Machine Learning Models Used
K-Nearest Neighbors (KNN):
Uses distance-based similarity to recommend the crop most frequently occurring among its k-nearest neighbors.

Logistic Regression (Multinomial):
Applies multiclass classification to predict the crop using linear decision boundaries.

Decision Tree Classifier:
Uses tree-based decision rules to classify input data into different crop categories.

📊 Features
User-friendly web interface built with R Shiny

Input fields for:

Nitrogen (N)

Phosphorus (P)

Potassium (K)

Temperature (°C)

Humidity (%)

pH Value

Rainfall (mm)

Displays model-specific crop recommendations

Shows accuracy of each model

Real-time predictions upon input submission

⚙️ Technologies Used
R Programming

Shiny (Web App Framework)

caret, class, rpart, nnet, e1071 (ML Packages)

dplyr, readr, scales (Data Handling & Display)

📁 Dataset
The dataset used includes agricultural features like:

N, P, K contents in soil

Temperature, Humidity, pH, and Rainfall

Crop label (target variable)

Preprocessing includes normalization and label encoding for ML model compatibility.

