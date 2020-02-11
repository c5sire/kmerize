cmp <- function() {

  fp <- file.path(get_kmc_base(), "kmc_tools")
  fp <- assure_kmc3_ext(fp)
  fp <- get_safe_path(fp)

  fp <- paste(fp, "complex")
  
  return(fp)
  
}

