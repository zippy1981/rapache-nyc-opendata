# render a plot based of shapes in nycgiszoningfeatures_201311_shp/
# shapes downloaded from https://nycopendata.socrata.com/api/geospatial/kdig-pewd?method=export&format=Shapefile
require(rgeos)
require(maptools)
require(rgdal)

shapeDir <- 'nycgiszoningfeatures_201311_shp\'
shapeFiles <- dir(shapeDir, '\\.shp$')
shapeLayers <- sub('\\.shp$', '', shapeFiles)
# to see the files sprintf("%s/%s", shapeDir, shapeFiles)
# TODO: I'm told for loops are evil in R. Find a better way
for (i in 1:length(shapeLayers) ) {
  map <- readOGR(shapeDir, shapeLayers[i])
  plot(map, col="gray",border="blue", axes=TRUE)
}