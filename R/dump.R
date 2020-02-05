dump <- function(db, to) {
  fp <- file.path(get_kmc_base(), "kmc_dump")
  fp <- assure_kmc3_ext(fp)
  fp <- normalizePath(fp)
  fp <- paste(fp,  db,  to)
  
  return(fp)
}