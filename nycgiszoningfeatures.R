# render a plot based of shapes in nycgiszoningfeatures_201311_shp/
# shapes downloaded from https://nycopendata.socrata.com/api/geospatial/kdig-pewd?method=export&format=Shapefile
require(rgeos)
require(maptools)
require(rgdal)

# size of the map
lon_range <- c( -74.5, -73.25 )
lat_range <- c( 40.24, 41.5 )
# The projection we want see http://gis.stackexchange.com/a/82317/25580
crs <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

shapeDir <- 'nycgiszoningfeatures_201311_shp'
shapeFiles <- dir(shapeDir, '\\.shp$')
shapeLayers <- sub('\\.shp$', '', shapeFiles)
# to see the files sprintf("%s/%s", shapeDir, shapeFiles)
# TODO: I'm told for loops are evil in R. Find a better way
for (i in 1:length(shapeLayers) ) {
  
  map <- spTransform(
    readOGR(shapeDir, shapeLayers[i]),
    crs
  )
  plot(
    map, 
    #xlim = lon_range, ylim = lat_range, 
    col="gray",border="blue", axes=TRUE
  )
}
