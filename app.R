library(shiny)

ui <- fluidPage(
  "Did this deploy via github actions?",
  textInput("input", "Input"),
  actionButton("button", "button"),
  htmlOutput("output")
)

server <- function(input, output, session) {
  my_output <- reactiveVal("")
  observeEvent(
    input$button,
    {
      my_output(c(isolate(input$input), my_output()))
      output$output <- renderUI(HTML(paste(my_output(), collapse = "<br>")))
    }
  )
}

shinyApp(ui, server)
