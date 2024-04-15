# Install required packages if not already installed
if (!requireNamespace("diveRsity", quietly = TRUE)) {
  install.packages("diveRsity")
}

# Set the working directory to where your .gen file is located
setwd("path/to/your/directory")

# Load required libraries
library(diveRsity)

# Generate 1000 Fst pairwise matrices for barrier
writeBoot(infile = "43clean.gen", outfile = "test", gp = 3, bootstraps = 1000, parallel = TRUE)

# Barrier in Windows:
# Load the coordinate datafile
# Load the multiple pairwise matrices as barriers
