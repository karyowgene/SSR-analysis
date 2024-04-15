# Set working directory
setwd("/path/to/your/directory")

# Install and load required packages
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
if (!requireNamespace("rmaverick", quietly = TRUE)) {
  devtools::install_github("bobverity/rmaverick")
}
library(rmaverick)
library(parallel)

# Set up parallel processing
cores <- detectCores()
cl <- makeCluster(cores)

# Converting data into data.frame
mydata <- read.csv(file = "rmavin.csv", header = TRUE, sep = ",")
myproj <- mavproject()
myproj <- bind_data(myproj, mydata, ID_col = 1, pop_col = 2, ploidy_col = 3)
myproj <- new_set(myproj, name = "correct model (no admixture)", admix_on = FALSE)
myproj <- new_set(myproj, name = "incorrect model (admixture)", admix_on = TRUE)

# Run MCMC analysis
myproj <- run_mcmc(myproj, K = 1:5, burnin = 1e3, samples = 1e3, rungs = 10, pb_markdown =  TRUE)
myproj <- run_mcmc(myproj, K = 5, burnin = 1e4, converge_test = 100, samples = 1e3, rungs = 10, pb_markdown =  TRUE)
myproj <- run_mcmc(myproj, K = 1:10, burnin = 1e6, converge_test = 100, samples = 1e4, rungs = 20, pb_markdown =  TRUE)
myproj <- run_mcmc(myproj, K = 1:10, burnin = 1e6, converge_test = 100, samples = 1e6, rungs = 20, pb_markdown =  TRUE, cluster = cl)

# Plot results
plot_GTI_path(myproj, K = 3)
plot_logevidence_K(myproj)
plot_posterior_K(myproj)
plot_qmatrix(myproj, K = 2:5, divide_ind_on = TRUE)