## READ IN DATA ####
source("scripts/rcourse_lesson3_cleaning.R")

## LOAD PACKAGES ####
# [none currently needed]

## ORGANIZE DATA ####
# Full season data
data_stats = data_clean

# Player specific data
data_posey_stats = data_posey_clean


## BUILD MODEL - FULL SEASON DATA ####
allstar.glm = glm(win ~ allstar_break, family = "binomial", data = data_stats)

allstar.glm_sum = summary(allstar.glm)
allstar.glm_sum


## BUILD MODEL - PLAYER SPECIFIC DATA ####
posey_walked.glm = glm(win ~ walked, family = "binomial", data = data_posey_stats)

posey_walked.glm_sum = summary(posey_walked.glm)
posey_walked.glm_sum

