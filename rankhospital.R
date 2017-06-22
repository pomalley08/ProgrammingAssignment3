################################################################################
# Course: R Programming
# Title:  Week 4 Programming Assignment 3 - rankhospital.R function
# Author: Patrick O'Malley
# Date:   6/21/17
################################################################################

# Create a function to return the nth ranked hospital in a state

rankhospital <- function(state, outcome, num = "best") {
        # Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE,
                         na.strings = "Not Available")
        # Check that state and outcome are valid
        if(state %in% data[, 7] & outcome %in% c("heart attack", 
                                                 "heart failure", 
                                                 "pneumonia")) {
                # use best/worst functions for those selections
                if(num %in% c("best")) {
                        hsp <- best(state, outcome)
                }
                else if(num %in% c("worst")) {
                        hsp <- worst(state, outcome)
                }
                else {
                        # Return hospital name in state for given rank 30-day death rate
                        if(outcome %in% c("heart attack")) {
                                st_data <- data[data[, 7] %in% state, ]
                                st_data <- st_data[order(st_data[, 11], 
                                                         st_data[, 2]), ]
                                st_data <- st_data[which(!is.na(st_data[, 11])), ]
                                hsp <- st_data[num, 2]
                        }
                        else if(outcome %in% c("heart failure")) {
                                st_data <- data[data[, 7] %in% state, ]
                                st_data <- st_data[order(st_data[, 17], 
                                                         st_data[, 2]), ]
                                st_data <- st_data[which(!is.na(st_data[, 17])), ]
                                hsp <- st_data[num, 2]
                        }
                        else {
                                st_data <- data[data[, 7] %in% state, ]
                                st_data <- st_data[order(st_data[, 23], 
                                                         st_data[, 2]), ]
                                st_data <- st_data[which(!is.na(st_data[, 23])), ]
                                hsp <- st_data[num, 2]
                        }
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