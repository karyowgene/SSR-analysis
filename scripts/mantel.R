# Install and Load required library
install.packages("vegan")
library(vegan)

# Set the working directory to where your Excel file is located
setwd("path/to/your/directory")

# Upload the Excel data
Envdist <- readxl::read_excel("your_excel_file.xlsx")

# Remove the 'pop' column
Envdist <- Envdist[, -which(names(Envdist) == "pop")]

# Convert environmental PCs into distance
IBE <- vegdist(Envdist, method = "gower")

# Mantel test
mantel(genti.dist, speci.dist)
mantel(GenDist19, Geodist19, permutations = 10000)
mantel.partial(GenDist19, Geodist19, Envdist, permutations = 10000)
