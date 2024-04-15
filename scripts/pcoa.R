# Set working directory
setwd("/path/to/your/directory")

# Install and load required packages
if (!requireNamespace("vegan", quietly = TRUE)) {
  install.packages("vegan")
}
if (!requireNamespace("ape", quietly = TRUE)) {
  install.packages("ape")
}
if (!requireNamespace("scatterplot3d", quietly = TRUE)) {
  install.packages("scatterplot3d")
}
library(vegan)
library(ape)
library(scatterplot3d)

# Perform PCoA with cmdscale
pcoa1 <- cmdscale(lgd1, k = 3)  # vegan

# Perform PCoA with pcoa function from ape
pcoa1test <- pcoa(lgd1)  # ape
testaxis <- pcoa1test$vectors  # ape

# Plot results with scatterplot3d
scatterplot3d(testaxis[,1:3], pch = 16, color = "blue")

# Create vectors and matrices, and bind them to pcoa results
vec2 <- rep(c("JH", "HR", "ZD", "DG", "LZX"), times = c(19, 17, 19, 20, 20))
vecall <- c("BS", "XXT", "HDY", "KEB", "LQQ", "HW", "YLZ", "JH", "HR", "ZD", "DG", "LZX", "HXD", "DP", "LQ", "MK", "CH", "DT", "HH", "LZ", "LG", "SJ", "BD", "NM", "FC", "BL", "WC", "DC")
vecr <- rep(c("ClusterI", "ClusterII", "ClusterIII", "ClusterIV", "ClusterV"), times = c(7, 5, 4, 7, 5))
vec1 <- as.matrix(vec1)
pcoa2_1 <- cbind(pcoa2, new_col = vec2)

# Rename column names
colnames(pcoa2_1) <- c("Axis1", "Axis2", "Axis3", "pop")

# Convert to data.frame
pcoa1_1 <- as.data.frame(pcoa1_1)

# Plot scatterplot with colors based on 'pop'
colors <- c("red", "blue", "green", "gold", "black", "purple", "brown")
colors <- colors[as.numeric(pcoa1_1$pop)]
scatterplot3d(pcoa1_1[,1:3], pch = 16, color = colors)

# Add legend
legend("top", legend = levels(pcoa5_1$pop), pch = 19 , bg = "white", col = colors, xpd = TRUE, horiz = TRUE, cex = 0.8, inset = -0.08)

# Save plot as PDF
pdf("pcoa_plot.pdf")
scatterplot3d(pcoa1[,1:3], pch = 16, color = colors)
dev.off()