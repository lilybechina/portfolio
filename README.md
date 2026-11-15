# EVR 628 Portfolio - World Sea Ice Analysis

## Author
Lily Bechina - lfb107@miami.edu

## Description
Analyzing world sea ice extent in the peak melt months for each respective
hemisphere* from 1979 - 2025 to show sea ice loss over time. Peak melt months 
were chosen rather than the whole year for visualization purposes.

*northern hemisphere (NH) peak melt month - september;
 southern hemisphere (SH) peak melt month - february 

## Assignment description
Assignment 1 - creating the portfolio
- objective: create and prepare the portfolio for future use
  
Assignment 2 - data wrangling 
- objective: load and clean data; create plots to visualize sea ice extent in
             the world from 1979 - 2026
             
Assignment 3 - visualizing spatial data
- objective: create 4 maps to visualize minimum and maximum sea ice extent in 
             both hemispheres
             
# Repo contents
data 
- data/raw contains raw data downloaded directly from the web
- data/processed contains processed data ready for analysis & visualization

results/img
- contains figures that visualize the data

scripts
- scripts/01_processing contains scripts to process and clean the raw data
- scripts/03_content contains scripts to analyze and visualize the data 

README
- informs collaborators about this repo

## Raw data source
### .CSV files:

National Oceanic and Atmospheric Administration (NOAA) / National Snow and Ice 
Data Center (NSIDC)

link: https://www.ncei.noaa.gov/access/monitoring/snow-and-ice-extent/

NH Sept Raw Data - sea_ice_sept_northern.csv  (path = "data/raw/sea_ice_sept_northern.csv")

SH Feb Raw Data - sea_ice_feb_southern.csv    (path = "data/raw/sea_ice_feb_southern.csv")

### .TIF files:

National Snow and Ice Data Center (NSIDC)

link: https://nsidc.org/data/g02135/versions/4#anchor-data-access 
(navigate to "HTTPS File System Location")

NH Sept Max - N_198009_extent_v4.0.tif    (path = "data/raw/N_198009_extent_v4.0.tif")

NH Sept Min - N_201209_extent_v4.0.tif    (path = "data/raw/N_201209_extent_v4.0.tif")

SH Feb Max - S_200802_extent_v4.0.tif     (path = "data/raw/S_200802_extent_v4.0.tif")

SH Feb Min - S_202302_extent_v4.0.tif     (path = "data/raw/S_202302_extent_v4.0.tif")

## R scripts
data_processing.R                 (path = "scripts/processing/data_processing.R")

exploratory_data_visualization.R  (path = "scripts/content/exploratory_data_visualization.R")

spatial_data_visualization.R      (path = scripts/content/spatial_data_visualization.R")

## Clean data (produced in processing script)
sea_ice_world.rds                 (path = "data/processed/sea_ice_world.rds")

sea_ice_by_hem.rds                (path = "data/processed/sea_ice_by_hem.rds")

## Figures (produced in visualization scripts)
global_ice_extent                 (path = "results/img/global_ice_extent.png")

hem_ice_extent                    (path = "results/img/hem_ice_extent.png")

hem_extent_dist                   (path = "results/img/hem_extent_dist.png")

northern_max                      (path = "results/img/northern_max.png")

northern_min                      (path = "results/img/northern_min.png")
                     
southern_max                      (path = "results/img/southern_max.png")

southern_min                      (path = "results/img/southern_min.png")