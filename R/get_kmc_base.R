get_kmc_base <- function() {
  os <- get_os()
  fp <- file.path(system.file("kmc3", package = "kmerize"), os)
  fp <- fix_win_path(fp)
  return(fp)
}

