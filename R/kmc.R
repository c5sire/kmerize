kmc <- function() {
  los <- get_os()
  wp <- paste0(file.path(get_kmc_base(), "kmer_counter.exe"))
  op <- file.path(get_kmc_base(), "kmc")
  fp <- ifelse(los == "Windows", wp, op)

  return(fp)
}
