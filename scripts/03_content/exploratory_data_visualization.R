# World Sea Ice Extent - Data Wrangling (data visualization)
################################################################################
# Lily Bechina
# lfb107@miami.edu
# 10/8/26
#
# Creating 3 different plots to explore the data
################################################################################  

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(tidyverse)

## Load data -------------------------------------------------------------------
sea_ice_by_hem <- read_rds(file = "data/processed/sea_ice_by_hem.rds")
sea_ice_total_world <- read_rds(file = "data/processed/sea_ice_total_world.rds")

# Build data frame to use for plot 2
extremes <- data.frame(year = c(1980, 2012, 2008, 2023),
                       value = c(7.67, 3.57, 3.89, 1.98),
                       hemisphere = c("Northern", "Northern", "Southern", "Southern"))

# VISUALIZE ####################################################################

## Make plots ------------------------------------------------------------------
# Plot 1 - Global extent over time with smooth line (of peak melt months)
global_ice_extent <- ggplot(data = sea_ice_total_world, 
       mapping = aes(x = year, y = value)) +
       geom_point(alpha = 0.2, color = "blue") +
       geom_smooth(se = F) +                            # remove confidence band
       labs(x = "Year",
            y = "Extent (million km²)",
            caption = "Data Source: NOAA / National Snow and Ice Data Center (NSIDC)",
            title = "Global Sea Ice Extent Over Time",
            subtitle = "Using peak melt months (NH - September, SH - February)") +
       theme_bw() 

# Plot 2 - Northern vs. southern extent over time on same plot with smooth line
hem_ice_extent <- ggplot(data = sea_ice_by_hem,
       mapping = aes(x = year, y = value, color = hemisphere)) +
       geom_line() +
       geom_smooth() +
       geom_point(data = extremes, 
                  aes(color = hemisphere), 
                  size = 2) +
       labs(x = "Year",
            y = "Sea Ice Extent (million km²)",
            color = "Hemisphere",
            caption = "Data Source: NOAA / National Snow and Ice Data Center (NSIDC)",
            title = "Sea Ice Extent by Hemisphere",
            subtitle = "Using peak melt months (NH - September, SH - February)") +
       theme_bw() 

# Plot 3 - Histogram to show the distribution of extent values among hemispheres
hem_extent_dist <- ggplot(data = sea_ice_by_hem,
       mapping = aes(x = value, fill = hemisphere)) +
       geom_histogram() +
       labs(x = "Sea Ice Extent (million km²)",
            y = "Count (yr)", 
            fill = "Hemisphere",
            caption = "Data Source: NOAA / National Snow and Ice Data Center (NSIDC)",
            title = "Distribution of Sea Ice Extent Values (in peak melt months)",
            subtitle = "Using peak melt months (NH - September, SH - February)") +
       theme_bw()

# EXPORT #######################################################################

## Save files (using relative paths)
ggsave(plot = global_ice_extent, filename = "results/img/global_ice_extent.png")
ggsave(plot = hem_ice_extent, filename = "results/img/hem_ice_extent.png")
ggsave(plot = hem_extent_dist, filename = "results/img/hem_extent_dist.png")