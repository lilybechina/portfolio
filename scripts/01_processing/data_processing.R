# World Sea Ice Extent - Data Wrangling (data processing)
################################################################################
# Lily Bechina
# lfb107@miami.edu
# 10/6/26
#
# Putting the sea ice data from the northern hemisphere and the southern 
# hemisphere together, cleaning & tidying the data
################################################################################  

# Load packages
library(tidyverse)
library(janitor)

# Read data, skip metadata (using relative paths)
sea_ice_sept_northern <- read_csv(file = "data/raw/sea_ice_sept_northern.csv",
                          skip = 4)

sea_ice_feb_southern <- read_csv(file = "data/raw/sea_ice_feb_southern.csv",
                          skip = 4)

# Add columns to delineate northern vs. southern hemisphere
sea_ice_sept_northern <- sea_ice_sept_northern |> 
  mutate(hemisphere = "Northern") 

sea_ice_feb_southern <- sea_ice_feb_southern |>
  mutate(hemisphere = "Southern") |> 
  filter(Date != 2026)       # remove 2026 row because northern does not have it

# Put northern and southern hemisphere data into one table called sea_ice_by_hem
sea_ice_by_hem <- bind_rows(sea_ice_sept_northern, sea_ice_feb_southern) |> 
                  clean_names() |> 
                  rename(year = date) |>
                  relocate(year, hemisphere) 

# Make a new table with a column showing total global sea ice in each year
sea_ice_total_world <- sea_ice_by_hem |> 
  group_by(year) |> 
  summarise(value = sum(value))

# Write data (export the new tables using relative paths)
write_rds(x = sea_ice_by_hem, file = "data/processed/sea_ice_by_hem.rds")
write_rds(x = sea_ice_total_world, file = "data/processed/sea_ice_total_world.rds")
  



