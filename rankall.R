################################################################################
# Course: R Programming
# Title:  Week 4 Programming Assignment 3 - rankall.R function
# Author: Patrick O'Malley
# Date:   6/21/17
################################################################################

# Return the hospital from each state with a specified ranking for an outcome

rankall <- function(outcome, num = "best") {
        # Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE,
                         na.strings = "Not Available")
        # Check that state and outcome are valid
        #hosp <- data.frame(hospital = character(), state = character())
        hosp <- character()
        states <- unique(data$State)
        states <- states[order(states)]
        for(i in 1:length(states)) {
                hosp[i] <- rankhospital(states[i], outcome, num)
        }
        # For each state find hospital with given rank
        
        # Return a data frame with hospital names and state names
        hosp <- as.data.frame(cbind(hosp, states))
        colnames(hosp) <- c("hospital", "state")
        return(hosp)
}