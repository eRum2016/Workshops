## Visualising spatial data with R: from 'base' to 'shiny' - Robin Lovelace (Leeds Institute for Data Analytics, University of Leeds)
 
**Description of proposed workshop**

R is well known for data analysis and statistics. Less well-known is that R can function as a full Geographical Information System (GIS). This workshop will demonstrate these powerful capabilities through visualising spatial data: the art of map making. It will walk participants through map making using a range of approaches, started with the oldest and most basic and ending with a fully interactive map participants will create using the shiny and leaflet packages. The goals are to demonstrate R's spatial data capabilities and teach attendees how to make beautiful maps.

By the end of the course participants will:

- Have a basic understanding of the structure of spatial data in R
- Be able to perform basic spatial queries to explore spatial objects
- Understand the advantages and disadvantages of different mapping paradigms, including base, spplot, ggmap, tmap, leaflet, mapview and shiny approaches
- Be proficient in the use of R to create maps using add-on packages such as tmap
- Be able to create interactive maps ready for deployment online

 
**Plan of the workshop**

- Loading and reprojecting spatial data
- Spatial queries: over(), gIntersection() and aggregate()
- An overview of plotting paradigms in R: spplot, ggmap, tmap, leaflet, mapview and shiny
- Static maps with base and spplot paradigms
- ggmap
- tmap: a new approach for the flexible visualisation of spatial data
- Interactive maps with leaflet, mapview and shiny
 
**Required packages**

pkgs <- c("ggmap", "rgdal", "rgeos", "tmap", "leaflet", "mapview", "shiny")

install.packages(pkgs)

lapply(pkgs, library, character.only = TRUE) # load the required packages
 
**Required skills of participants**

Working knowledge of R, RStudio, ggplot and online maps is assumed.

Working knowledge of spatial data is desirable.
 
**Required work to do before workshop**

Participants should have worked through the tutorial An Introduction to Visualising Spatial Data in R: https://github.com/Robinlovelace/Creating-maps-in-R Alternatively participants should the equivalent level of experience with sp, ggmap, tmap and leaflet packages.
 
**Research experience**

I have 3 years postdoctoral experience developing and applying methods for spatial data analysis, modelling and visualising. I'm the lead developer of the Department for Transport project the Propensity to Cycle Tool: http://pct.bike/
 
**Experience as lecturer/teacher**

I have 5 years teaching R to a range of audiences including academic, public sector and industry. I have taught in Newcastle, Girona, Bremen and Cambridge on various courses.
