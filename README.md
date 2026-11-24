# Sea Ice Analysis by Hemisphere
Author: Lily Bechina - lfb107@miami.edu

This project uses world sea ice extent data from the National Snow and Ice Data 
Center. Data is used to visualize sea ice in the peak melt months by each 
respective hemisphere* from 1979 - 2025 to show sea ice loss over time. Peak
melt months were chosen rather than the whole year for visualization purposes.

*northern hemisphere (NH) peak melt month - September;
 southern hemisphere (SH) peak melt month - February 

## Data Sources

### 'data/raw/sea_ice_sept_northern.csv'

- **Title of the dataset:** Sea Ice / Northern Hemisphere / September
- **Source:** https://www.ncei.noaa.gov/access/monitoring/snow-and-ice-extent/sea-ice/N/9
- **Date of download or access, if relevant:** Oct 8, 2026

### 'data/raw/sea_ice_feb_southern.csv'

- **Title of the dataset:** Sea Ice / Southern Hemisphere / February
- **Source:** https://www.ncei.noaa.gov/access/monitoring/snow-and-ice-extent/sea-ice/S/2
- **Date of download or access, if relevant:** Oct 8, 2026

### 'data/raw/N_198009_extent_v4.0.tif'

- **Title of the dataset:** Sea Ice / Northern Hemisphere / September / 1980
- **Source:** https://nsidc.org/data/g02135/versions/4#anchor-data-access 
- **Date of download or access, if relevant:** Nov 11, 2026

### 'data/raw/N_201209_extent_v4.0.tif'

- **Title of the dataset:** Sea Ice / Northern Hemisphere / September / 2012
- **Source:** https://nsidc.org/data/g02135/versions/4#anchor-data-access 
- **Date of download or access, if relevant:** Nov 11, 2026

### 'data/raw/S_200802_extent_v4.0.tif'

- **Title of the dataset:** Sea Ice / Southern Hemisphere / February / 2008
- **Source:** https://nsidc.org/data/g02135/versions/4#anchor-data-access 
- **Date of download or access, if relevant:** Nov 11, 2026

### 'data/raw/S_202302_extent_v4.0.tif'

- **Title of the dataset:** Sea Ice / Southern Hemisphere / February / 2023
- **Source:** https://nsidc.org/data/g02135/versions/4#anchor-data-access 
- **Date of download or access, if relevant:** Nov 11, 2026

## Repository structure and contents

- 'data': Contains the raw, processed, and output data
  - 'data/raw/sea_ice_sept_northern.csv': Raw sea ice extent data for the NH in Sept
  - 'data/raw/sea_ice_feb_southern.csv': Raw sea ice extent data for the SH in Feb
  - 'data/raw/N_198009_extent_v4.0.tif': Raw sea ice extent spatial data for the NH in Sept 1980
  - 'data/raw/N_201209_extent_v4.0.tif': Raw sea ice extent spatial data for the NH in Sept 2012
  - 'data/raw/S_200802_extent_v4.0.tif': Raw sea ice extent spatial data for the SH in Feb 2008
  - 'data/raw/S_202302_extent_v4.0.tif': Raw sea ice extent spatial data for the SH in Feb 2023
  - 'data/processed/sea_ice_by_hem.rds': Sea ice extent by hemisphere by year, produced by 'scripts/processing/data_processing.R'
  - 'data/processed/sea_ice_total_world.rds': Sea ice extent for the world by year, produced by 'scripts/processing/data_processing.R'
- 'scripts': Contains all R scripts used in this project
 - 'scripts/processing/data_processing.R': This file reads 'data/raw/sea_ice_sept_northern.csv' and 'data/raw/sea_ice_feb_southern.csv', cleans and merges the data, adds a hemisphere row, exports 'data/processed/sea_ice_by_hem.rds' and 'data/processed/sea_ice_total_world.rds'
 - 'scripts/content/exploratory_data_visualization.R': This file reads 'data/processed/sea_ice_by_hem.rds' and 'data/processed/sea_ice_total_world.rds', and confiugres 3 plots to visualize the data, exports 'results/img/global_ice_extent.png', 'results/img/hem_ice_extent.png' and 'results/img/hem_extent_dist.png'
 - 'scripts/content/spatial_data_visualization.R': This file reads 'data/raw/N_198009_extent_v4.0.tif', 'data/raw/N_201209_extent_v4.0.tif', 'data/raw/S_200802_extent_v4.0.tif', 'data/raw/S_202302_extent_v4.0.tif', and 'data/processed/sea_ice_by_hem.rds' and creates 4 maps to visualize the spatial extent of ice over time by hemisphere, exports 'results/img/northern_max.png', 'results/img/northern_min.png', 'results/img/southern_max.png', 'results/img/southern_min.png'
- 'results': Contains all outputs
  - 'results/img/global_ice_extent.png': Plot of global sea ice extent over time, produced by 'scripts/content/exploratory_data_visualization.R'
  - 'results/img/hem_ice_extent.png': Plot of sea ice extent by hemisphere over time, produced by 'scripts/content/exploratory_data_visualization.R'
  - 'results/img/hem_extent_dist.png': Plot of distribution of sea ice extent values by hemisphere, produced by 'scripts/content/exploratory_data_visualization.R' 
  - 'results/img/northern_max.png': Map of NH maximum sea ice extent in Sept, produced by 'scripts/content/spatial_data_visualization.R'
  - 'results/img/northern_min.png': Map of NH minimum sea ice extent in Sept, produced by 'scripts/content/spatial_data_visualization.R'
  - 'results/img/southern_max.png': Map of SH maximum sea ice extent in Feb, produced by 'scripts/content/spatial_data_visualization.R'
  - 'results/img/southern_min.png': Map of SH minimum sea ice extent in Feb, produced by 'scripts/content/spatial_data_visualization.R'