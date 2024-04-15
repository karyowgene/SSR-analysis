# Set working directory
setwd("/path/to/your/directory")

# Install and load required packages
if (!requireNamespace("spaMM", quietly = TRUE)) {
  install.packages("spaMM")
}
if (!requireNamespace("car", quietly = TRUE)) {
  install.packages("car", lib.loc="C:/Program Files/R/R-3.5.1/library")
}
library(spaMM)
library(car)

# Load Excel data
logmlall <- readxl::read_excel("logmlall.xlsx")

# GLM-VIF
fullfit <- fitme(HO ~ bio_1 + Matern(1|lat+long), data = logmlall, method = "ML")
summary(fullfit)

nullfit <- fitme(HO ~ 1 + Matern(1|lat+long), data = logmlall, method = "ML")
summary(nullfit)

# pvalue
1 - pchisq(2 * (logLik(fullfit) - logLik(nullfit)), df = 1)

extractAIC(fullfit)

# VIF
vif(glm(bio_10 ~ + bio_15 + bio_14 + bio_5 + bio_17 + bio_19, data = logmlall))