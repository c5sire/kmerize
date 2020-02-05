dump <- function(db, to) {
  fp <- file.path(get_kmc_base(), "kmc_dump.exe")
  
  fp <- normalizePath(fp)
  fp <- paste(fp,  db,  to)
  
  return(fp)
}