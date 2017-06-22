################################################################################
# Course: R Programming
# Title:  Week 4 Programming Assignment 3
# Author: Patrick O'Malley
# Date:   6/21/17
################################################################################

# Assignment will explore US hospital data

# import and view outcome data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
names(outcome)
ncol(outcome)
nrow(outcome)

# Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)

# Finding the best hospital by state
unique(outcome$State) # includes territories like puerto rico & guam


# Create function to return best hospital for a given state and outcome
# best.R
source("C:/Data_Science/JHU_Data_Science/R_Programming/ProgrammingAssignment3/best.R")
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")

worst("NY", "heart attack")

# Ranking hospitals by outcome in a state
source("C:/Data_Science/JHU_Data_Science/R_Programming/ProgrammingAssignment3/worst.R")
source("C:/Data_Science/JHU_Data_Science/R_Programming/ProgrammingAssignment3/rankhospital.R")
rankhospital("SC", "heart attack", "worst")
rankhospital("SC", "heart attack", "best")
rankhospital("SC", "heart attack", 1)

hosp %>% filter(State %in% c("MN")) %>% 
        select(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack) %>% 
        arrange(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name) %>% View()

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
rankhospital("MN", "heart attack", 2)

# Ranking hospitals in all states
source("C:/Data_Science/JHU_Data_Science/R_Programming/ProgrammingAssignment3/rankall.R")
debug(rankall)
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
