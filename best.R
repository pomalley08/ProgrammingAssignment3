################################################################################
# Course: R Programming
# Title:  Week 4 Programming Assignment 3 - best.R function
# Author: Patrick O'Malley
# Date:   6/21/17
################################################################################

# Create function to return best hospital for a given state and outcome
best <- function(state, outcome) {
        # Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE,
                         na.strings = "Not Available")
        # Check that state and outcome are valid
        if(state %in% data[, 7] & outcome %in% c("heart attack", 
                                                 "heart failure", 
                                                 "pneumonia")) {
                # Return hospital name in the state with lowest 30-day death rate
                if(outcome %in% c("heart attack")) {
                        st_data <- data[data[, 7] %in% state, ]
                        st_data <- st_data[order(st_data[, 2]), ]
                        hsp <- st_data[which.min(st_data[, 11]), 2]
                }
                else if(outcome %in% c("heart failure")) {
                        st_data <- data[data[, 7] %in% state, ]
                        st_data <- st_data[order(st_data[, 2]), ]
                        hsp <- st_data[which.min(st_data[, 17]), 2]
                }
                else {
                        st_data <- data[data[, 7] %in% state, ]
                        st_data <- st_data[order(st_data[, 2]), ]
                        hsp <- st_data[which.min(st_data[, 23]), 2]
                }
        }
        else if(state %in% data[, 7]) {
                stop("invalid outcome. Choose from: 'heart attack', 
                     'heart failure', or 'pneumonia'")
        }
        else {
                stop("invalid state name")
        }
        return(hsp)
}