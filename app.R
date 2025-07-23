library(shiny)
library(shinythemes)
library(randomForest)
library(ggplot2)

# Load trained model
rf_model <- readRDS("crop_rf_model.rds")

# UI layout
ui <- fluidPage(
  theme = shinytheme("flatly"),
  
  tags$head(
    tags$style(HTML("
      .main-title {
        color: #28a745;
        text-align: center;
        font-size: 42px;
        font-weight: bold;
        margin-bottom: 30px;
      }
      .predict-title {
        font-size: 28px;
        color: #333333;
        font-weight: 600;
        margin-bottom: 15px;
      }
      .output-box {
        background-color: #f9f9f9;
        border: 2px solid #28a745;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        font-size: 26px;
        font-weight: bold;
        color: #28a745;
        margin-top: 20px;
      }
      footer {
        text-align: center;
        margin-top: 30px;
        padding: 10px;
        font-size: 14px;
        color: #777777;
      }
      .btn-custom {
        background-color: #28a745;
        color: white;
        font-size: 18px;
        padding: 12px 20px;
        border-radius: 5px;
        width: 100%;
      }
    "))
  ),
  
  div(class="main-title", "🌾 Dynamic Crop Recommendation System"),
  
  sidebarLayout(
    sidebarPanel(
      tags$h4("🌱 Enter Soil & Weather Values", style="color:#333333; font-weight:600;"),
      numericInput("N", "Nitrogen (N)", 90, min=0, max=140),
      numericInput("P", "Phosphorous (P)", 42, min=0, max=145),
      numericInput("K", "Potassium (K)", 43, min=0, max=205),
      numericInput("temperature", "Temperature (°C)", 25),
      numericInput("humidity", "Humidity (%)", 80),
      numericInput("ph", "pH Level", 6.5),
      numericInput("rainfall", "Rainfall (mm)", 120),
      actionButton("predictBtn", "🌱 Predict Crop", class="btn-custom"),
      width = 4
    ),
    
    mainPanel(
      tags$div(class="predict-title", "Predicted Crop:"),
      tags$div(verbatimTextOutput("prediction"), class="output-box"),
      br(),
      plotOutput("probPlot", height = "300px")
    )
  ),
  
  tags$footer("© 2025 Dynamic Crop Recommendation System | Built by Ayush Kumar")
)

# Server logic
server <- function(input, output) {
  
  observeEvent(input$predictBtn, {
    
    new_data <- data.frame(
      N = input$N,
      P = input$P,
      K = input$K,
      temperature = input$temperature,
      humidity = input$humidity,
      ph = input$ph,
      rainfall = input$rainfall
    )
    
    # Predict probabilities
    probs <- predict(rf_model, newdata=new_data, type="prob")
    
    # Best crop and its probability
    result <- colnames(probs)[which.max(probs)]
    prob_score <- round(max(probs) * 100, 2)
    
    # Display prediction text with confidence
    output$prediction <- renderText({
      paste(result, "(Confidence:", prob_score, "%)")
    })
    
    # Show bar chart of top 5 crop probabilities
    output$probPlot <- renderPlot({
      top_probs <- sort(probs[1,], decreasing=TRUE)[1:5]
      top_df <- data.frame(Crop=names(top_probs), Probability=as.numeric(top_probs))
      
      ggplot(top_df, aes(x=reorder(Crop, Probability), y=Probability, fill=Crop)) +
        geom_bar(stat="identity") +
        coord_flip() +
        labs(title="Top 5 Crop Prediction Probabilities", x="Crop", y="Probability") +
        theme_minimal() +
        scale_fill_brewer(palette="Set2") +
        geom_text(aes(label=paste0(round(Probability*100, 1), "%")), hjust=-0.1)
    })
    
  })
}

# Run the app
shinyApp(ui=ui, server=server)
