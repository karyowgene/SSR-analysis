# Set working directory
setwd("/path/to/your/directory")

# Install and load required packages
if (!requireNamespace("rgdal", quietly = TRUE)) {
  install.packages("rgdal")
}
library(rgdal)

# Read dataset
dataset <- read.table("coordzl.txt", header = TRUE)

# Convert long/lat to UTM
utm_coordinates <- project(as.matrix(dataset[, c("X", "Y")]), "+proj=utm +zone=45N ellps=WGS84")