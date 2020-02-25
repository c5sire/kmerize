get_kmc_base <- function() {
  fp <- get_kmc_dir()

  kmc_ok <- check_install_ok()
  if (!kmc_ok) {
    stop("KMC3 is missing for this package.
         Please install with kmr_install_kmc().")
  }

  return(fp)
}
