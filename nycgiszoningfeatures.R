# render a plot based of shapes in nycgiszoningfeatures_201311_shp/
require(rgeos)
require(maptools)
require(rgdal)

shapeDir <- 'nycgiszoningfeatures_201311_shp\'
shapeFiles <- dir(shapeDir, '\\.shp$')
# to see the files sprintf("%s/%s", shapeDir, shapeFiles)
# TODO: I'm told for loops are evil in R. Find a better way
for (i in 1:length(shapeFiles) ) {
  map <- readOGR(shapeDir, shapeFiles[i])
  plot(map, col="gray",border="blue", axes=TRUE)
}