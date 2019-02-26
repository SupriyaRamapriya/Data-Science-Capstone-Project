library(shiny)

shinyUI(fluidPage(
        navbarPage("PredictWord",
                   tabPanel("Home",
                            sidebarLayout(
                                    sidebarPanel(
                                            h4('Input Text:'), 
                                            tags$textarea(id="text_in", rows=2, cols=30),
                                            sliderInput("suggestions", "No. of Predictions:",
                                                        value = 1.0, min = 1.0, max = 5.0, step = 1.0),
                                            HTML("<br><br>"),
                                            h4("Instructions"),
                                            HTML("<p>This Shiny App predicts the next word based on the text you typed."),
                                            HTML("<br><br>The input fields are as follows."),
                                            HTML("<li><b>Input Text</b>: Text entered for prediction."),
                                            HTML("<li><b>No. of Predictions</b>: Number of words that the algorithm will predict."),
                                            HTML("<br><br>The below output will be produced reactively as you type."),
                                            HTML("<li><b>Next Word</b>: The predicted next word(s), shown when the app detects that you have finsihed typing one or more words."),
                                            HTML("<li><b>Last Word Being Typed</b>: The predicted word(s) being typed, shown when the app detects that you are typing a word partially."),
                                            HTML("<br><br>Please allow a few seconds for the output to appear.")
                                    ),
                                    mainPanel(
                                            h3("Next Word"),
                                            verbatimTextOutput('word.next'),
                                            HTML("<br>"),
                                            h4("Last Word Being Typed"),
                                            verbatimTextOutput('word.current')
                                    )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                                    column(12,
                                           includeHTML("about.html"))
                            )
                   )
        )
))