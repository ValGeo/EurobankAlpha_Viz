library(shiny)
shinyUI(fluidPage(theme = "bootstrap.css",
                  headerPanel("Eurobank Vs. Alpha Bank through economic crisis"),
                                mainPanel(
                                    htmlOutput("view"),
                                    br(),
                                    br(),
                                    h5('This visualization presents the track of stock values of two among the biggest banks in Greece'),
                                    br(),
                                    br(),
                                    HTML('<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">EurobankAlpha Visualization</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Valantis and Dimitris</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.')
                                    , width = 7
                                ))
)