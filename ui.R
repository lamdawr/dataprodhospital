library(shiny)
mydata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
choicestate <- unique(mydata$State)
shinyUI(
  pageWithSidebar(
  headerPanel("Hospital Statistics Inputs"),

  
  sidebarPanel(
    selectInput('state', label = "Select a State", choices = choicestate, selected = "AL"),
# #    selectInput('state', label = "Select a State", choices =  c("AL"="1","AK"="2","AZ"="3", "AR"="4", "CA"="5","CO"="6", "CT"="7",
#                                                                   "DE"="8", "DC"="9", "FL"="10", "GA"="11", "HI"="12", "ID"="13", "IL"="14",
#                                                                   "IN"="15", "IA"="16", "KS"="17", "KY"="18", "LA"="19", "ME"="20", "MD"="21",
#                                                                   "MA"="22", "MI"="23", "MN"="24", "MS"="25", "MO"="26", "MT"="27", "NE"="28",
#                                                                   "NV"="29", "NH"="30", "NJ"="31", "NM"="32", "NY"="33", "NC"="34", "ND"="35",
#                                                                   "OH"="36", "OK"="37", "OR"="38", "PA"="39", "PR"="40", "RI"="41", "SC"="42",
#                                                                   "SD"="43", "TN"="44", "TX"="45", "UT"="46", "VT"="47", "VI"="48", "VA"="49",
#                                                                   "WA"="50", "WV"="51", "WI"="52", "WY"="53", "GU"="54"), selected = "1"),
#    
    selectInput('outcome', "Select an outcome",
                       c("heart attack",
                         "heart failure",
                         "pneumonia"), "heart attack"),
    
    sliderInput('num', 'Numeric input, labeled rank', 1, min = 1, max = 90),
    
    submitButton('Submit')
  ),
  
  mainPanel(
        
      p('The dataset used in this analysis is taken from the sample data provided in the R programming course.
    This data is a collection of different hospitals from different states and their metrics for a given speciality.
    
    Based on the given metrics, the hospitals are sorted for a given speciality for different states.
    The hospitals are ranked based on the mortality rate for a given speciality.
    The results are stored as ranks for a particular speciality in a given state.
    
    In the shinyapp, the inputs given are : state, specialty and rank.
    The shinyapp would give the hospital name that matches the given criteria.'),
      
        h3('Outputs'),
        h4('You entered State'),
        verbatimTextOutput("oid1"),
        h4('You entered Disease'),
        verbatimTextOutput("oid2"),
        h4('You entered Rank'),
        verbatimTextOutput("oid3"),
        h4('Prediction'),
       verbatimTextOutput("result")
  )
 )
)
