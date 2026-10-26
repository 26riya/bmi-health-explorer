
library(shiny)

shinyServer(function(input, output, session) {
  
  bmi_data <- eventReactive(input$calculate, {
    
    validate(
      need(!is.null(input$weight), "Enter your weight."),
      need(!is.null(input$height), "Enter your height."),
      need(input$weight >= 1 && input$weight <= 350,
           "Weight must be between 1 and 350 kg."),
      need(input$height >= 50 && input$height <= 250,
           "Height must be between 50 and 250 cm.")
    )
    
    height_m <- input$height / 100
    bmi <- input$weight / (height_m ^ 2)
    
    category <- if (bmi < 18.5) {
      "Underweight"
    } else if (bmi < 25) {
      "Healthy weight"
    } else if (bmi < 30) {
      "Overweight"
    } else {
      "Obesity"
    }
    
    list(
      bmi = round(bmi, 2),
      category = category
    )
  })
  
  output$bmi_result <- renderUI({
    
    if (input$calculate == 0) {
      return(
        p("Enter your measurements and click Calculate BMI.")
      )
    }
    
    result <- bmi_data()
    
    tagList(
      h3(paste("Your BMI:", result$bmi)),
      h4(paste("Category:", result$category)),
      p(
        "This result is an adult screening estimate,",
        "not a medical diagnosis."
      )
    )
  })
  
})
