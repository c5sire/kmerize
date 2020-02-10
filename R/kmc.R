kmc <- function() {
  if (get_os() == "Windows") {
    fp <- paste0( file.path(get_kmc_base(), "kmer_counter.exe"))  
  } else {
    fp <- file.path(get_kmc_base(), "kmc") 
  }
   fp <- get_safe_path(fp)
  
  return(fp)
}

