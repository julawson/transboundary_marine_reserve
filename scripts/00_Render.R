
# List of sets of R Markdown files
file_sets <- list(
  c("01_functions.Rmd", "02_base_params.Rmd", "05_theta_model_Mab_rev.Rmd"),
  c("01_functions.Rmd", "02_base_params.Rmd", "05_theta_model_Mba_rev.Rmd"),
  c("01_functions.Rmd", "02_base_params.Rmd", "05_theta_model_D_ba.Rmd")
)

# Loop through each set of files
for (rmd_set in file_sets) {
  # Clear the environment
  rm(list = ls())
  
  # Loop through the R Markdown files in the current set
  for (rmd_file in rmd_set) {
    # Render the R Markdown file
    rmarkdown::render(rmd_file)
  }
}