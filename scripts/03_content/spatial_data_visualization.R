# World Sea Ice Extent - Spatial Data Visualization
################################################################################
# Lily Bechina
# lfb107@miami.edu
# 11/10/26
#
# Visualizing the maximum and minimum extent of sea ice in both hemispheres 
# (in their respective peak melt months)
# See README for more info
################################################################################  

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(tidyverse)                       # Transforming and plotting data
library(sf)                              # Working with vector data 
library(terra)                           # Working with raster data
library(tidyterra)                       # Tidying raster data
library(rnaturalearth)                   # Adding country outlines
library(ggspatial)                       # Adding spatial components to ggplot

# Turn off sf geometries that assume the world isn't flat to make cropping easier
sf_use_s2(F) 

## Load data -------------------------------------------------------------------
  # The data was selected for this visualization by finding which year has the  
  # max and min extent in each hemisphere in the data_processing.R script

# Northern hemisphere raster data
northern_max_data <- rast("data/raw/N_198009_extent_v4.0.tif")  
northern_min_data <- rast("data/raw/N_201209_extent_v4.0.tif")
  
# Southern hemisphere raster data
southern_max_data <- rast("data/raw/S_200802_extent_v4.0.tif")
southern_min_data <- rast("data/raw/S_202302_extent_v4.0.tif")

## Insert coastlines -----------------------------------------------------------

# Difference in cropping for optimal visualization
north_coast <- ne_countries() |>                               
  st_crop(ymin = 49.1, ymax = 90, xmin = -180, xmax = 180) |>  
  st_transform("EPSG:3411")

south_coast <- ne_countries() |> 
  st_crop(ymin = -90, ymax = -50, xmin = -180, xmax = 180) |> 
  st_transform("EPSG:3412")
  
# PROCESSING ###################################################################

## Transform all values other than 1 (sea ice) into 0, remove 0s ---------------
# Northern hemisphere
northern_max_2 <- 1 * (northern_max_data == 1) |> 
  filter(N_198009_extent_v4.0 > 0) 

northern_min_2 <- 1 * (northern_min_data == 1) |> 
  filter(N_201209_extent_v4.0 > 0) 

# Southern hemisphere
southern_max_2 <- 1 * (southern_max_data == 1) |> 
  filter(S_200802_extent_v4.0 > 0) 

southern_min_2 <- 1 * (southern_min_data == 1) |> 
  filter(S_202302_extent_v4.0 > 0) 

# VISUALIZE ####################################################################

## Make plots ------------------------------------------------------------------
# Northern hemisphere
northern_max <- ggplot() +
  geom_spatraster(data = northern_max_2) +         # Add sea ice extent data
  geom_sf(data = north_coast,                      # Add coast/continent outlines
          fill = "gray",
          color = "black",
          linewidth = 0.3) +
  scale_fill_gradient(low = "blue",                # Use low and high because data set technically has 1s and 0s
                      high = "blue",
                      na.value = "transparent", 
                      labels = NULL) +             # Removes the number "1" next to the legend bar
  scale_x_continuous(expand = c(0.1, 0)) +         # Makes the plot more square & removes extra space
  scale_y_continuous(expand = c(0, 0)) +
  theme_bw() +
  theme(legend.key.width = unit(1, "cm"),           
        legend.key.height = unit(0.25, "cm")) +
  # Orient north arrow to true north (the center of the map)
  annotation_north_arrow(location = "tr", which_north = "true") +    
  annotation_scale(location = "bl") +
  labs(fill = "Ice Extent",
       x = "Longitude (°)",
       y = "Latitude (°)", 
       title = "Northern Hemisphere Maximum Sea Ice Extent, 1980",
       subtitle = "in regards to NH peak melt month - September",
       caption = "Data Source: National Snow and Ice Data Center")

northern_min <- ggplot() +
  geom_spatraster(data = northern_min_2) +
  geom_sf(data = north_coast, 
          fill = "gray",
          color = "black",
          linewidth = 0.3) +
  scale_fill_gradient(low = "blue",                 
                      high = "blue",
                      na.value = "transparent", 
                      labels = NULL) +              
  scale_x_continuous(expand = c(0.1, 0)) +         
  scale_y_continuous(expand = c(0, 0)) +
  theme_bw() +
  theme(legend.key.width = unit(1, "cm"),           
        legend.key.height = unit(0.25, "cm")) +
  # Orient north arrow to true north (the center of the map)
  annotation_north_arrow(location = "tr", which_north = "true") +    
  annotation_scale(location = "bl") +
  labs(fill = "Ice Extent",
       x = "Longitude (°)",
       y = "Latitude (°)", 
       title = "Northern Hemisphere Minimum Sea Ice Extent, 2012",
       subtitle = "in regards to NH peak melt month - September",
       caption = "Data Source: National Snow and Ice Data Center")
  
# Southern hemisphere
southern_max <- ggplot() +
  geom_spatraster(data = southern_max_2) +
  geom_sf(data = south_coast, 
          fill = "gray",
          color = "black",
          linewidth = 0.3) +
  scale_fill_gradient(low = "blue",                 
                      high = "blue",
                      na.value = "transparent", 
                      labels = NULL) +              
  scale_x_continuous(expand = c(0, 0)) +           # Removes extra space 
  scale_y_continuous(expand = c(0, 0)) +
  theme_bw() +
  theme(legend.key.width = unit(1, "cm"),           
        legend.key.height = unit(0.25, "cm")) +
  # Orient north arrow to true north (away from the center of the map)
  annotation_scale(location = "bl") +
  annotation_north_arrow(location = "tr", which_north = "true") +    
  labs(fill = "Ice Extent",
       x = "Longitude (°)",
       y = "Latitude (°)", 
       title = "Southern Hemisphere Maximum Sea Ice Extent, 2008",
       subtitle = "in regards to SH peak melt month - February",
       caption = "Data Source: National Snow and Ice Data Center")

southern_min <- ggplot() +
  geom_spatraster(data = southern_min_2) +
  geom_sf(data = south_coast, 
          fill = "gray",
          color = "black",
          linewidth = 0.3) +
  scale_fill_gradient(low = "blue",                 
                      high = "blue",
                      na.value = "transparent", 
                      labels = NULL) +              
  scale_x_continuous(expand = c(0, 0)) +           # Removes extra space
  scale_y_continuous(expand = c(0, 0)) +
  theme_bw() +
  theme(legend.key.width = unit(1, "cm"),           
        legend.key.height = unit(0.25, "cm")) +
  # Orient north arrow to true north (away from the center of the map)
  annotation_north_arrow(location = "tr", which_north = "true") +   
  annotation_scale(location = "bl") +
  labs(fill = "Ice Extent",
       x = "Longitude (°)",
       y = "Latitude (°)", 
       title = "Southern Hemisphere Minimum Sea Ice Extent, 2023",
       subtitle = "in regards to SH peak melt month - February",
       caption = "Data Source: National Snow and Ice Data Center")

# EXPORT #######################################################################

## As png files ----------------------------------------------------------------  
ggsave(plot = northern_max, filename = "results/img/northern_max.png") 
ggsave(plot = northern_min, filename = "results/img/northern_min.png")

ggsave(plot = southern_max, filename = "results/img/southern_max.png")
ggsave(plot = southern_min, filename = "results/img/southern_min.png")