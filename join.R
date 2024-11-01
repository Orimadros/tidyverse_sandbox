'''
ChatGPT Drill:

Instructions:

Create two tables from the mtcars dataset:

Table 1: A subset that includes car specifications like name, cylinders, 
displacement, and horsepower. Also, create a new column here that classifies
cars as "high-power" or "low-power" based on whether their horsepower is above
or below the median horsepower of mtcars.

Table 2: A subset that includes car performance metrics: name, miles per gallon,
quarter-mile time, and a new column indicating "efficiency" as "high" if mpg is
above the median, or "low" if below.

Merge the tables, retaining only the power and efficiency columns. Then analyze
the conditional distributions of the two variables.

''' 

library(tidyverse)

# creating table 1
specs <- mtcars %>%
  select(-mpg, -qsec) %>%
  mutate(power = if_else(hp > median(hp), 'high-power', 'low-power')) %>%
  rownames_to_column('car')

# creating table 2, experimenting with case_when() in place of if_else()
performance <- mtcars %>%
  select(mpg, qsec) %>%
  mutate(efficiency = case_when(
    mpg >= median(mpg) ~ 'high',
    mpg < median(mpg) ~ 'low',
    mpg > 2 * mpg ~ 'what?'
  )) %>%
  rownames_to_column('car')

left <- specs %>%
  left_join(performance, by = car)
