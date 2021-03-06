library(shiny)
library(dplyr)
library(tidyr)
library(lubridate)
library(readr)
library(shinythemes)

shinyUI(fluidPage(
  theme = "simplex.css",
  titlePanel("Vendor Tier File Upload"),
  helpText("Version 0.0.4"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Upload the file"), # fileinput() function is used to get the file upload contorl option
      helpText("Default max. file size is 5MB"),
      tags$hr(),
      h5(helpText("Select read table parameters below")),
      # checkboxInput(inputId = 'header', label = 'Header', value = TRUE),
      #checkboxInput(inputId = "stringAsFactors", "stringAsFactors", value=TRUE),
      checkboxInput(inputId = "na.rm", "Remove NA's", value = TRUE),
      br(),
      radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space='', caret='^'), selected = ',')
      #,downloadButton('downloadData', 'Download')
#       tags$hr(),
#       h5(helpText("Table dowloaded as displayed. Cannot be NULL"))
      # downloadButton('downloadData', 'Download')
      
    ),
    
  
    
    # sidebarPanel(),
    mainPanel(
      uiOutput("tb")
      
      # use below code if you want the tabset programming in the main panel. If so, then tabset will appear when the app loads for the first time.
      #       tabsetPanel(tabPanel("Summary", verbatimTextOutput("sum")),
      #                   tabPanel("Data", tableOutput("table")))
    )
    
  )
))