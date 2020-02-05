kmc <- function() {
  if (get_os() == "Windows") {
    fp <- paste0( file.path(get_kmc_base(), "kmer_counter.exe"))  
  } else {
    fp <- file.path(get_kmc_base(), "kmc")
  }
  
  #fp <- fix_win_path(fp)
  normalizePath(fp)
  
  return(fp)
  
}

