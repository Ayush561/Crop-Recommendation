🌾 Dynamic Crop Recommendation System (R Shiny + Random Forest)
This project is an advanced Crop Recommendation Web Application built with R Shiny and powered by a Random Forest Machine Learning model. It helps farmers and agriculture professionals determine the most suitable crop to grow based on environmental and soil parameters, offering not only predictions but also model confidence and top-5 crop probabilities.

🔍 Project Overview
With climate and soil conditions playing a vital role in agriculture, this dynamic system allows users to input real-time values for soil nutrients and environmental factors, and receive a high-confidence crop recommendation. The model also visualizes the top 5 most likely crops with their corresponding probabilities, helping in informed decision-making.

🧠 Core Features
✅ Random Forest-based Prediction Engine

✅ User-Friendly R Shiny Interface

✅ Confidence Score for Prediction

✅ Top 5 Crop Probabilities Visualization

✅ Fully Responsive Design with Modern UI

🔧 Inputs Required
Users are prompted to enter:

🌿 Nitrogen (N)

🌿 Phosphorous (P)

🌿 Potassium (K)

🌡️ Temperature (°C)

💧 Humidity (%)

⚗️ pH Level

🌧️ Rainfall (mm)

These inputs are then passed to the trained model for prediction.

📊 Output
Predicted Crop with confidence percentage

Bar Chart showing the Top 5 crops by probability

Clean and modern visual design with dynamic styling

🛠️ Technologies Used
Language: R

Framework: Shiny

ML Library: randomForest

Visualization: ggplot2

UI Styling: shinythemes, HTML/CSS styling via tags$style

📁 Model Details
The model crop_rf_model.rds is a trained Random Forest classifier.

Trained on a dataset with multiple crop types and soil-climate features.

Output includes class probabilities for every crop type.

