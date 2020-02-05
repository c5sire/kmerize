cmp <- function() {

  fp <- file.path(get_kmc_base(), "kmc_tools")
  fp <- assure_kmc3_ext(fp)
  fp <- normalizePath(fp)
  
  fp <- paste(fp, "complex")
  
  return(fp)
  
}

