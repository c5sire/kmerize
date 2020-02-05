check_install_ok <- function() {
  los <- get_os()
  kmc_dir <- get_kmc_dir() 
  
  kmc <- "kmc"
  if (los == "Windows") kmc <- "kmer_counter.exe"
  kmcc <- file.path(kmc_dir, kmc)
  kmc_ok <- file.exists(kmcc)
  return(kmc_ok)
}