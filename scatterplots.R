# this code follows the introductory exercise in Hadley Wickham's R4DS book.

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

penguins %>%
  ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = 'lm') +
  labs(title = 'Body mass and flipper length',
       subtitle = 'Dimensions for Adelie, Chinstrap, and Gentoo penguins',
       x = 'Flipper Length (mm)',
       y = 'Body Mass (g)',
       color = 'Species',
       shape = 'Species') +
  scale_color_colorblind()

# Exercises

# 1. How many rows are in 'penguins'?

glimpse(penguins)

# R1: There are 344 rows

# 3. Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is, 
# make a scatterplot with bill_depth_mm on the y-axis and 
# bill_length_mm on the x-axis. Describe the relationship between 
# these two variables.

penguins %>%
  ggplot(mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = 'lm') +
  labs(
    title = 'Bill length and depth',
    subtitle = 'Dimensions for Adelie, Chinstrap, and Gentoo penguins',
    x = 'Bill Length (mm)',
    y = 'Bill Depth (mm)',
    color = 'Species',
    shape = 'Species'
    ) +
  scale_color_colorblind()

# R3: We can se here a textbook case of Simpson's paradox in the data. The
# relationship between bill length and depth is negative in the aggregate, but 
# positive for each of the species.

# 4. What happens if you make a scatterplot of species vs. bill_depth_mm? 
# What might be a better choice of geom?

penguins %>%
  ggplot(mapping = aes(x = bill_depth_mm, y = species)) +
  geom_point(mapping = aes(color = species, shape = species)) +
  labs(
    title = 'Bill length and depth',
    subtitle = 'Dimensions for Adelie, Chinstrap, and Gentoo penguins',
    x = 'Bill Length (mm)',
    y = 'Species',
  ) +
  scale_color_colorblind()

# R4: That's a silly graph. it would make more sense to put boxplots for each
# species' distribution of bill length side by side, for example.

# 5. Why does the following give an error and how would you fix it?
# ggplot(data = penguins) + 
#  geom_point()

# R5: The programmer added a geom without defining the aesthetic mapping.
# Without choosing x and y columns through the aes() function beforehand, 
# there's no way for the geom_point() function to know the values it must use
# to populate the graph with points.

# 8. Recreate the following visualization [picture in the book]. What aesthetic 
# should bill_depth_mm be mapped to? And should it be mapped at the global 
# level or at the geom level?

penguins %>%
  ggplot(mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g,
    color = bill_depth_mm)) +
  geom_point() +
  geom_smooth() +
  labs(title = 'Body mass and flipper length',
       x = 'Flipper Length (mm)',
       y = 'Body Mass (g)')
