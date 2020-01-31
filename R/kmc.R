cmd_kmc <- function() {
  if (get_os() == "Windows") {
    fp <- paste0( file.path(get_kmc_base(), "kmer_counter"))  
    fp <- sprintf('"%s"', fp)
  } else {
    fp <- file.path(get_kmc_base(), "kmc")
  }
  
  return(fp)
  
}