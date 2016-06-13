## READ IN DATA ####
source("scripts/rcourse_lesson3_cleaning.R")
## LOAD PACKAGES ####
library(ggplot2)
## ORGANIZE DATA ####
# Full season data
data_figs = data_clean %>%
  mutate(allstar_break = factor(allstar_break, levels = c("before", "after")))

# Summarise full season data by All-Star break
data_figs_sum = data_figs %>%
  group_by(allstar_break) %>%
  summarise(wins_perc = mean(win) * 100) %>%
  ungroup()

# Player specific data
data_posey_figs = data_posey_clean

# Summarise player specific data by if walked or not
data_posey_figs_sum = data_posey_figs %>%
  group_by(walked) %>%
  summarise(wins_perc = mean(win) * 100) %>%
  ungroup()

## MAKE FIGURES ####
# All-star break
allstar.plot = ggplot(data_figs_sum, aes(x = allstar_break, y = wins_perc)) +
  geom_bar(stat = "identity") +
  ylim(0, 100)

pdf("figures/allstar.pdf")
allstar.plot
dev.off()


# Posey walked or not
posey_walked.plot = ggplot(data_posey_figs_sum, aes(x = walked, y = wins_perc)) +
  geom_bar(stat = "identity") +
  ylim(0, 100)

pdf("figures/posey_walked.pdf")
posey_walked.plot
dev.off()