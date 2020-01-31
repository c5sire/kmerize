get_kmc_base <- function() {
  os <- get_os()
  fp <- file.path(system.file("kmc3", package = "kmerize"), os)
  if (os == "Windows") {
    #fp <- gsub(" ", "` ", fp)
  }
  
  return(fp)
}

