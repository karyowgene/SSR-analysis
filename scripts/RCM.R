# Install required packages if not already installed
if (!requireNamespace("genepop", quietly = TRUE)) {
  install.packages("genepop")
}
if (!requireNamespace("vegan", quietly = TRUE)) {
  install.packages("vegan")
}

# Set the working directory to where your Excel file is located
setwd("path/to/your/directory")

# Load required libraries
library(genepop)
library(vegan)

# Run Fst function
Fst(inputFile = "out9gpop.txt", outputFile = "out9", pairs = TRUE)

# Mantel test
mantel(gdall, geoall, permutations = 10000)
mantel.partial(gd23, geoall, envd, permutations = 10000)

# Reciprocal causal model (RCM) equations
# Gen~IBD|IBR
# Gen~IBR|IBD
# Gen~IBD|IBR - Gen~IBR|IBD = support for IBD
# Gen~IBR|IBD - Gen~IBD|IBR = support for IBR
