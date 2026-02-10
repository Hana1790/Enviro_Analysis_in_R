## Chesapeake bay practice with spatial data ##
#### 2/3/2026 Environmental Analysis in R #####

library(tidyverse)
library(sf)

p.counties <- "./County_Boundaries.shp"
p.stations <- "./Non-Tidal_Water_Quality_Monitoring_Stations_in_the_Chesapeake_Bay.shp"

d.counties <- sf::read_sf(p.counties) #you read in shapefiles and other files with this
d.stations <- sf::read_sf(p.stations)

glimpse(d.counties)

#counties in delaware
del.counties <- d.counties %>% dplyr::filter(STATEFP10 == 10)

#need to investigate their CRS
d.counties %>% sf::st_crs()
d.stations %>% sf::st_crs()

#they're in the same CRS, but we can formally test this
d.counties %>% sf::st_crs() == d.stations %>% sf::st_crs() #result is true
