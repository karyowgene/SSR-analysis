# Set working directory
setwd("/Users/godfreywagutu/magnolia/")

# Install and load required packages
if (!requireNamespace("adegenet", quietly = TRUE)) {
  install.packages("adegenet")
}
library(adegenet)

# Read data
adegn <- read.csv(file = "adegn.csv", header = TRUE, sep = ",")

# Read genepop file
x <- read.genepop("gpop.GEN", ncode = 3)

# Find clusters
find_clusters <- find.clusters(x, max.n.clust = 15)

# Perform DAPC with all PCs
dapc1 <- dapc(x, find_clusters$grp)

# Perform DAPC without finding clusters
dapc2 <- dapc(zlatdapc, zlatdapc$pop)

# Plot results
scatter(dapc1)
compoplot(dapc1, posi = "bottomright", txt.leg = paste("Cluster", 1:5), lab = "", xlab = "individuals", col = c("yellow", "lightgreen", "darkblue", "purple", "red"))
barplot(t(as.matrix(clusters)), col = c("green", "yellow", "darkblue", "hotpink", "red"), xlab = "Individual", ylab = "Ancestry", border = NA)
scatter(dapc1, scree.da = FALSE, bg = "white", pch = 17:20, cell = 0, cstar = 0, col = c("darkgreen", "purple", "darkblue", "black", "red"), solid = 0.4, cex = 3, clab = 0, leg = TRUE, txt.leg = paste("Cluster", 1:5))
scatter(dapc1, scree.da = TRUE, bg = "white", pch = 15:19, cell = 0, cstar = 0, col = c("#46081A", "#05D5FA", "darkgreen", "#FA8B05", "#97163B"), solid = 0.5, cex = 1.2, clab = 0, leg = TRUE, txt.leg = paste("Cluster", 1:5))
scatter(dapc1, scree.da = FALSE, bg = "white", pch = 20, cell = 4, cstar = 3, col = myCol, solid = 0.4, cex = 3, clab = 0, leg = TRUE, txt.leg = paste("Cluster", 1:3))
scatter(dapc1, scree.da = FALSE, bg = "white", pch = 20, cell = 4, cstar = 3, solid = 0.4, cex = 3, clab = 0, leg = TRUE, txt.leg = paste("Cluster", 1:3))
scatter(dapc1, scree.da = FALSE, bg = "white", pch = 20, cell = 4, cstar = 3, solid = 0.4, cex = 3, clab = 0, leg = TRUE, txt.leg = paste("Cluster", 1:3))
scatter(dapc1, 1, 1, col = myCol, bg = "white", scree.da = FALSE, legend = TRUE, solid = 0.4)
scatter(dapc1, 1, 1, bg = "white", scree.da = FALSE, legend = TRUE, solid = 0.5)