library(tidyverse)

# converting data from wide to long format, and back again
mtcars_long <- mtcars %>%
  pivot_longer(
    cols = c(mpg, hp, gear),
    names_to = 'measurement',
    values_to = 'values'
  )

back_again <- mtcars_long %>%
  pivot_wider(
    names_from = measurement,
    values_from = values
  ) %>%
  select(names(mtcars))

back_again == mtcars


# It worked fine, but apparently the original ids with the car names 
# got lost along the way. Lets try to fix this.

# converting data from wide to long format, and back again
mtcars_long <- mtcars %>%
  rownames_to_column('car') %>%
  pivot_longer(
    cols = c(mpg, hp, gear),
    names_to = 'measurement',
    values_to = 'values'
  )

back_again <- mtcars_long %>%
  pivot_wider(
    names_from = measurement,
    values_from = values
  ) %>%
  select(names(mtcars), car) %>%
  column_to_rownames('car')


