get_kmc_base <- function() {
  os <- get_os()
  fp <- file.path(system.file("kmc3", package = "kmerize"), os)
 
  return(fp)
}

