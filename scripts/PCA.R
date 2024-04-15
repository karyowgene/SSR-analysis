# Set working directory
setwd("/path/to/your/directory")

# Install and load required packages
if (!requireNamespace("vegan", quietly = TRUE)) {
  install.packages("vegan")
}
library(vegan)

# Read data and perform PCA
envi1 <- read.csv("your_data_file.csv")  # Replace "your_data_file.csv" with your actual file name
PCAAnalysis <- prcomp(envi1, scale. = TRUE)
summary(PCAAnalysis)

# Perform PCA and get predicted values
pr <- prcomp(envi1, scale = TRUE)
predicted_values <- predict(pr, envi1)
predicted_values[, 1:2]

# Perform PCA on USArrests dataset
pr <- prcomp(USArrests, scale = TRUE)
summary(pr)  # Check cumulative proportion of >80% for two PCs
newdat <- pr$x[, 1:2]
newenvi1 <- pr$x[, 1]
newenv1.dist <- vegdist(scale(newenvi1), "euclid")