
library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI Health Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Enter your measurements"),
      
      numericInput(
        inputId = "weight",
        label = "Weight (kg):",
        value = 65,
        min = 1,
        max = 350
      ),
      
      numericInput(
        inputId = "height",
        label = "Height (cm):",
        value = 165,
        min = 50,
        max = 250
      ),
      
      actionButton(
        inputId = "calculate",
        label = "Calculate BMI",
        class = "btn-primary"
      ),
      
      br(), br(),
      
      helpText(
        "Enter your weight in kilograms and height in centimetres.",
        "Click Calculate BMI to view your result."
      )
    ),
    
    mainPanel(
      h3("Your Results"),
      uiOutput("bmi_result"),
      
      hr(),
      
      h4("How to use this application"),
      p("1. Enter your weight in kilograms."),
      p("2. Enter your height in centimetres."),
      p("3. Click Calculate BMI."),
      p("4. Read your BMI value and the category shown."),
      
      h4("About BMI"),
      p(
        "BMI is calculated by dividing weight in kilograms",
        "by height in metres squared."
      ),
      p(
        "For adults, commonly used BMI categories are:",
        "underweight: below 18.5;",
        "healthy weight: 18.5 to below 25;",
        "overweight: 25 to below 30;",
        "obesity: 30 or above."
      ),
      
      p(
        "BMI is a screening measure, not a diagnosis.",
        "These adult categories may not apply to children,",
        "teenagers, pregnant people, or every population."
      )
    )
  )
))
