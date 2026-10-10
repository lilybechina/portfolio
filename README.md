# EVR 628 Portfolio - World Sea Ice Analysis

## Author
Lily Bechina - lfb107@miami.edu

## Description
Analyzing world sea ice extent in the peak melt months for each respective
hemisphere* from 1979 - 2025 to show sea ice loss over time. 

*northern hemisphere peak melt month - september;
 southern hemisphere peak melt month - february 

## Assignment Description
Assignment 1 - creating the portfolio
- objective: create and prepare the portfolio for future use
  
Assignment 2 - data wrangling 
- objective: load and clean data; create plots to visualize sea ice extent in
             the world from 1979 - 2026

## Raw Data source
National Oceanic and Atmospheric Administration (NOAA) / National Snow and Ice 
Data Center (NSIDC)

link: https://www.ncei.noaa.gov/access/monitoring/snow-and-ice-extent/

Northern Hemisphere September Raw Data - sea_ice_sept_northern.csv  (path = "data/raw/sea_ice_sept_northern.csv")

Southern Hemisphere February Raw Data - sea_ice_feb_southern.csv    (path = "data/raw/sea_ice_feb_southern.csv")

## R scripts
data_processing.R                 (path = "scripts/processing/data_processing.R")

exploratory_data_visualization.R  (path = "scripts/content/exploratory_data_visualization.R")

## Clean data (produced in processing script)
sea_ice_world.rds                 (path = "data/processed/sea_ice_world.rds")

sea_ice_by_hem.rds                (path = "data/processed/sea_ice_by_hem.rds")

## Figures (produced in visualization script)
global_ice_extent                 (path = "results/img/global_ice_extent.png")

hem_ice_extent                    (path = "results/img/hem_ice_extent.png")

hem_extent_dist                   (path = "results/img/hem_extent_dist.png")
               
