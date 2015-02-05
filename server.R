library(shiny)

rankhospital <- function(state,outcome,num){
  mydata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(mydata[ , 7])
  disease <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% states) {
    stop("invalid state")
  }
  if (!outcome %in% disease){
    stop("invalid outcome")
  }
  if (outcome == "heart attack") {
    myset <- mydata[ , c( 2, 7, 11)]
  }
  if ( outcome == "heart failure") {
    myset <- mydata[ , c( 2,7, 17)]
  }
  if ( outcome == "pneumonia") {
    myset <- mydata[ , c( 2,7, 23)]
  }
  mySubset <- subset(myset, myset [,2] == state & myset[ , 3]  != "Not Available"  )
  mySubset[ , 3] <- as.numeric( mySubset[ , 3])
  myOutput1 <- mySubset[order(mySubset[ , 3], mySubset[ , 1]), ]
  
  datanum <- 0
  datanum <-nrow(myOutput1)
  
  if (is.character(num) == TRUE){
    if ( num == "best"){
      hospital <- (myOutput1[1,1])
      return(hospital)
      
    }
    
    if (num == "worst"){
      hospital <- (myOutput1[datanum,1])
      return(hospital)
    }        
    
  }
  
  if (num > datanum || num == 0){
    return(NA)
  }
  
  if (num <= datanum){
    hospital <- (myOutput1[num,1])
    return(hospital)
  }
  
}


shinyServer(
  function(input, output) {
    output$oid1 <- renderText({input$state})
    output$oid2 <- renderText({input$outcome})
    output$oid3 <- renderPrint({input$num})
    output$result <- renderPrint({rankhospital(input$state, input$outcome, input$num)})
    
  }
)